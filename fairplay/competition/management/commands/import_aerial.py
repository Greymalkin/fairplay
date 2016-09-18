import errno
import os
import tempfile
import shutil
import re
import datetime
from dbfread import DBF
from django.core.management.base import BaseCommand
from registration.models import Registration, Team, Gymnast, Level
from competition.models import Event, Division, Session
from meet.models import Meet


class Command(BaseCommand):
    """
    Go get the data from an Aerial backup, and parse it.
    * Create Athletes, Teams, Age Groups
    Example: $ ./manage.py import_aerial fairland.bak
    """
    args = "<BAK File>"

    def unsmoosh(self, archive_name, dir_name):
        with open(archive_name, 'rb') as f:
            # first get the last 30 bytes, where the size of the index is held
            f.seek(-30, os.SEEK_END)
            index_end = f.tell()
            index_start = int(f.read(30).split()[1]) - 1
            f.seek(index_start)

            # loop over the entries in the index, copying to temp files
            while index_start < index_end:
                info = f.read(50).split()
                file_name = info[0].decode("utf-8")
                file_start = int(info[1])
                file_size = int(info[2])

                with open(os.path.join(dir_name, file_name), 'wb') as output:
                    f.seek(file_start - 1)
                    output.write(f.read(file_size))

                index_start += 50
                f.seek(index_start)

    def handle(self, *args, **kwargs):

        # First, make a temp directory to do this work in
        temp_dir = tempfile.mkdtemp()

        self.unsmoosh(args[0], temp_dir)
        meet_name = None
        meet_date = None

        fc_header = DBF(os.path.join(temp_dir, 'fcHeader.dbf'))

        # first the meet itself
        for row in fc_header:
            meet_name = row['COMPNAME']
            meet_date = row['DATE']

        for meet in Meet.objects.all():
            meet.is_current_meet = False
            meet.save()

        meet = Meet(name=meet_name, short_name=meet_name, host=meet_name, date=meet_date, is_current_meet=True)
        meet.save()

        # then events...
        u_events = DBF(os.path.join(temp_dir, 'uEvents.dbf'))
        for row in u_events:
            if row['TYPE'] == "Men's":
                event = Event(meet=meet, order=row['SEQ'], name=row['EVENT'], initials=row['EVENTID'][:2])
                event.save()

        # then levels...
        levels = {}
        u_levels = DBF(os.path.join(temp_dir, 'uLevels.dbf'))
        # TODO: Does Aerial File contain Level Division info? e.g. d1, d2? Might not as Level Division change is very new.
        for row in u_levels:
            if row['TYPE'] == "Men's":
                level = Level(meet=meet, name="row['LEVELID']", level=row['LEVELID'], order=row['SEQ'])
                level.save()
                levels[row['LEVELID']] = level

        # then divisions...
        divisions = {}
        u_divs = DBF(os.path.join(temp_dir, 'uDivisions.dbf'))
        for row in u_divs:
            if row['TYPE'] == "Men's" and row['MEETCLASS'] == 'Local':
                level = levels[row['LEVELID']]
                division = Division(
                    meet=meet,
                    level=level,
                    name=row['ALIAS'],
                    short_name=row['ALIAS'],
                    min_age=row['MINAGE'],
                    max_age=row['MAXAGE'])
                division.save()
                divisions[row['LEVELID']+":"+row['ALIAS']] = division

        # then teams and athletes
        division_sessions = {}
        file_cabinet = DBF(os.path.join(temp_dir, 'FileCabinet.dbf'))
        for row in file_cabinet:
            team, created = Team.objects.get_or_create(
                meet=meet, gym=row['GYM'], team=row['GYM'])

            #TODO: remove registration model? If so, Change accordingly.
            registration, created = Registration.objects.get_or_create(
                meet=meet, team=team, received=datetime.datetime.today(), per_gymnast_cost=None, per_level_cost=None)

            level = levels[row['LEVELID']]
            division = divisions[row['LEVELID']+":"+row['AGEDIV']]

            gymnast = Gymnast()
            gymnast.meet = meet
            gymnast.registration = registration
            gymnast.team = team
            gymnast.dob = row['BIRTHDATE']
            gymnast.level = level
            gymnast.division = division
            gymnast.athlete_id = row['COMPNO']
            gymnast.last_name = row['LASTNAME']
            gymnast.first_name = row['FIRSTNAME']
            gymnast.usag = row['USAG']
            gymnast.is_us_citizen = (row['CITIZEN'] == 'Y')
            gymnast.save()

            if division in division_sessions:
                if division_sessions[division] != row['COMPID']:
                    print("Double booking of division! {} {}".format(row['LEVELID'], row['AGEDIV']))
                    division_sessions[division] = row['COMPID']
            else:
                division_sessions[division] = row['COMPID']

        # now the sessions
        for row in fc_header:
            session = Session(name='Session {}'.format(row['SESSION']), meet=meet)
            session.save()
            for division, compid in division_sessions.items():
                if compid == row['COMPID']:
                    session.divisions.add(division)
            session.save()


        # dbf = DBF(os.path.join(temp_dir, 'FileCabinet.dbf'))

        # for record in dbf:
        #     # Is there a team / group in the db?  No? Make it.  Retain object.
        #     team, created = models.Team.objects.get_or_create(
        #         name=record['GYM'])
        #     # Set default order number for age group based on parsing a number from the file ("6 years", "11 and up")
        #     group, created = models.Group.objects.get_or_create(
        #         level=int(record['LEVELID']),
        #         age_group=record['AGEDIV'],
        #         order=int(re.findall(r'\d+', record['AGEDIV'])[0]))
        #     # Make the athlete and associate to teams/groups
        #     athlete = models.Gymnast.objects.create(
        #         **{
        #             'athlete_id': int(record['COMPNO']),
        #             'usag_id': int(record['USAG']),
        #             'last_name': record['LASTNAME'],
        #             'first_name': record['FIRSTNAME'],
        #             'birth_date': record['BIRTHDATE'],
        #             'team': team,
        #             'group': group
        #         }
        #     )

        # try:
        #     shutil.rmtree(temp_dir)  # delete directory
        # except OSError as exc:
        #     if exc.errno != errno.ENOENT:  # ENOENT - no such file or directory
        #         raise  # re-raise exception

        # # Update the athlete positions for all the teams
        # for t in models.Team.objects.all():
        #     position = 0
        #     for gymnast in t.gymnasts.all():
        #         gymnast.position = position
        #         gymnast.save()
        #         position += 1

        # # Reset order for the age groups so they increase ordinally from 0
        # counter = 0
        # for g in models.Group.objects.all().order_by('level', 'order'):
        #     g.order = counter
        #     g.save()
        #     counter = counter + 1

        print('Import of csv data into cms: Done')
