from django.db.models.signals import post_save
from django.core.management import call_command
from django.core.management.base import BaseCommand
from competition.models import GymnastEvent


class Command(BaseCommand):
    """ Initial Setup can be called from a link that appears on the dashboard
        only when there are 0 Meets in the db """

    def handle(self, *args, **kwargs):
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

        # Not importing the scores... they are a one-to-one and cause the database to think you're re-creating primary key rows
        # Don't know how to get around that yet.
        # ... maybe could import the scores from a csv file instead?
