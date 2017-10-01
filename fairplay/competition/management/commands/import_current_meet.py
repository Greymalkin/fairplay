# import csv
import os
from django.db.models.signals import post_save
from django.conf import settings
from django.core.management import call_command
from django.core.management.base import BaseCommand
from competition.models import GymnastEvent, ScoreRankEvent
# from registration.models import Gymnast


class Command(BaseCommand):
    """ Import fixtures created with the Export Current Meet Management Command """

    def handle(self, *args, **kwargs):
        dirname = os.path.dirname(settings.BASE_DIR)
        dirname = os.path.join(dirname, 'fixtures/current_meet')

        print('... importing Meet')
        call_command('loaddata', 'fixtures/current_meet/meet.json')

        print('... importing Shirt Sizes')
        call_command('loaddata', 'fixtures/current_meet/shirtsize.json')

        print('... importing Disciplines')
        call_command('loaddata', 'fixtures/current_meet/discipline.json')

        print('... importing Events')
        call_command('loaddata', 'fixtures/current_meet/event.json')

        print('... importing Signs')
        call_command('loaddata', 'fixtures/current_meet/sign.json')

        print('... importing Sign Shows')
        call_command('loaddata', 'fixtures/current_meet/show.json')

        print('... importing Sign Messages')
        call_command('loaddata', 'fixtures/current_meet/showmessage.json')

        print('... importing Levels')
        call_command('loaddata', 'fixtures/current_meet/level.json')

        print('... importing Divisions')
        call_command('loaddata', 'fixtures/current_meet/division.json')

        print('... importing Sessions')
        call_command('loaddata', 'fixtures/current_meet/session.json')

        print('... importing Team Awards')
        call_command('loaddata', 'fixtures/current_meet/teamaward.json')

        print('... importing Teams')
        call_command('loaddata', 'fixtures/current_meet/team.json')

        print('... importing Team Ranks')
        call_command('loaddata', 'fixtures/current_meet/teamawardrank.json')

        print('... importing Coaches')
        call_command('loaddata', 'fixtures/current_meet/coach.json')

        print('... importing Gymnasts')
        call_command('loaddata', 'fixtures/current_meet/gymnast.json')

        print('... importing Gymnast Events')
        post_save.disconnect(None, sender=GymnastEvent, dispatch_uid='update_rankings')
        call_command('loaddata', 'fixtures/current_meet/gymnastevent.json')

        print('... importing Team Award Rank Events')
        call_command('loaddata', 'fixtures/current_meet/teamawardrankevent.json')

        print('... importing Team notes')
        call_command('loaddata', 'fixtures/current_meet/teamnotes.json')

        print('... importing Gymnast notes')
        call_command('loaddata', 'fixtures/current_meet/gymnastnotes.json')

        print('... importing Payments')
        call_command('loaddata', 'fixtures/current_meet/payments.json')

        print('... importing Scores')
        call_command('loaddata', 'fixtures/current_meet/scores.json')

        # scores... they are a one-to-one relation and their fixtures cause the database to think you're re-creating primary key rows
        # ... import the scores from a csv file instead

        # file = os.path.join(dirname, 'scorerankevent.csv')
        # if os.path.isfile(file):
        #     with open(file, 'r') as csvfile:
        #         print('... importing Scores')
        #         reader = csv.reader(csvfile)

        #         # skip csv rows before the row containing actual data
        #         next(reader)

        #         for row in reader:
        #             parse_usag = row[2].split()
        #             parse_usag = parse_usag[len(parse_usag) - 1]
        #             data = {}
        #             if row[3]:
        #                 data['fx'] = float(row[3])
        #             if row[4]:
        #                 data['ph'] = float(row[4])
        #             if row[5]:
        #                 data['sr'] = float(row[5])
        #             if row[6]:
        #                 data['vt'] = float(row[6])
        #             if row[7]:
        #                 data['pb'] = float(row[7])
        #             if row[8]:
        #                 data['hb'] = float(row[8])
        #             if row[9]:
        #                 data['ub'] = float(row[9])
        #             if row[10]:
        #                 data['bb'] = float(row[10])
        #             print('data:', data)
        #             if data:
        #                 g = Gymnast.objects.get(usag=parse_usag, meet__name=row[1])
        #                 s, created = ScoreRankEvent.objects.update_or_create(gymnast=g, meet__name=row[1], defaults=data)
        #                 print(s)
