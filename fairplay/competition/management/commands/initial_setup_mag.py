from django.core.management import call_command
from django.core.management.base import BaseCommand


class Command(BaseCommand):
    """ Initial Setup can be called from a link that appears on the dashboard """

    def handle(self, *args, **kwargs):
        print('Installing Fairplay starter, men\'s meet...')

        print('... events')
        call_command('loaddata', 'fixtures/meet_setup_mag/events.json')

        print('... shirt sizes')
        call_command('loaddata', 'fixtures/meet_setup_mag/shirtsizes.json')

        print('... led shows')
        call_command('loaddata', 'fixtures/meet_setup_mag/ledshows.json')

        print('... led signs')
        call_command('loaddata', 'fixtures/meet_setup_mag/ledsigns.json')

        print('... disciplines')
        call_command('loaddata', 'fixtures/meet_setup_mag/disciplines.json')

        print('... men\'s meet')
        call_command('loaddata', 'fixtures/meet_setup_mag/meet.json')

        print('... men\'s levels')
        call_command('loaddata', 'fixtures/meet_setup_mag/levels.json')

        print('... men\'s divisions')
        call_command('loaddata', 'fixtures/meet_setup_mag/divisions.json')

        print('... men\'s team awards')
        call_command('loaddata', 'fixtures/meet_setup_mag/awards.json')
