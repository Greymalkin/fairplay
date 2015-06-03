import errno
import os
import tempfile
import shutil
import re
from dbfread import DBF
from django.core.management.base import BaseCommand
from gymnastics import models


class Command(BaseCommand):
    """
    Go get the data from an Aerial backup, and parse it.
    * Create Athletes, Teams, Age Groups
    Example: $ ./manage.py import_aerial fairland.bak
    """
    args = "<BAK File>"

    def handle(self, *args, **kwargs):

        # First, make a temp directory to do this work in
        temp_dir = tempfile.mkdtemp()

        with open(args[0], 'rb') as f:
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

                with open(os.path.join(temp_dir, file_name), 'wb') as output:
                    f.seek(file_start - 1)
                    output.write(f.read(file_size))

                index_start += 50
                f.seek(index_start)

        # First, clear out athletes, teams, age groups in the db
        models.Athlete.objects.all().delete()
        models.Team.objects.all().delete()
        models.Group.objects.all().delete()
        models.Session.objects.all().delete()

        dbf = DBF(os.path.join(temp_dir, 'FileCabinet.dbf'))

        for record in dbf:
            # Is there a team / group in the db?  No? Make it.  Retain object.
            team, created = models.Team.objects.get_or_create(
                name=record['GYM'])
            # Set default order number for age group based on parsing a number from the file ("6 years", "11 and up")
            group, created = models.Group.objects.get_or_create(
                level=int(record['LEVELID']),
                age_group=record['AGEDIV'],
                order=int(re.findall(r'\d+', record['AGEDIV'])[0]))
            # Make the athlete and associate to teams/groups
            athlete = models.Athlete.objects.create(
                **{
                    'athlete_id': int(record['COMPNO']),
                    'usag_id': int(record['USAG']),
                    'last_name': record['LASTNAME'],
                    'first_name': record['FIRSTNAME'],
                    'birth_date': record['BIRTHDATE'],
                    'team': team,
                    'group': group
                }
            )

        try:
            shutil.rmtree(temp_dir)  # delete directory
        except OSError as exc:
            if exc.errno != errno.ENOENT:  # ENOENT - no such file or directory
                raise  # re-raise exception

        # Update the athlete positions for all the teams
        for t in models.Team.objects.all():
            position = 0
            for gymnast in t.athletes.all():
                gymnast.position = position
                gymnast.save()
                position += 1

        # Reset order for the age groups so they increase ordinally from 0
        counter = 0
        for g in models.Group.objects.all().order_by('level', 'order'):
            g.order = counter
            g.save()
            counter = counter + 1

        print('Import of csv data into cms: Done')
