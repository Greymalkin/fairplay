import meet
import registration
import competition

from django.core.management import call_command
from django.core.management.base import BaseCommand


class Command(BaseCommand):
    """ Initial Setup can be called from a link that appears on the dashboard
        only when there are 0 Meets in the db """

    def handle(self, *args, **kwargs):
        print('Evaluating status of Fairplay system ...')

        # events
        check = competition.models.Event.objects.all().count()
        if not check:
            print('... loading events')
            call_command('loaddata', 'fixtures/meet_setup_mag/events.json')

        # shirt sizes
        check = registration.models.ShirtSize.objects.all().count()
        if not check:
            print('... loading shirt sizes')
            call_command('loaddata', 'fixtures/meet_setup_mag/shirtsizes.json')

        # led shows
        check = competition.models.LEDShow.objects.all().count()
        if not check:
            print('... loading led shows')
            call_command('loaddata', 'fixtures/meet_setup_mag/ledshows.json')

        # led signs
        check = competition.models.LEDSign.objects.all().count()
        if not check:
            print('... loading led signs')
            call_command('loaddata', 'fixtures/meet_setup_mag/ledsigns.json')

        # disciplines
        check = registration.models.Discipline.objects.all().count()
        if not check:
            print('... loading disciplines')
            call_command('loaddata', 'fixtures/meet_setup_mag/disciplines.json')

        # if there is no meet in the database at all, set up an example one
        check = meet.models.Meet.objects.all().count()
        if not check:
            print('... loading mag meet')
            call_command('loaddata', 'fixtures/meet_setup_mag/meet.json')

            print('... loading levels')
            call_command('loaddata', 'fixtures/meet_setup_mag/levels.json')

            print('... loading divisions')
            call_command('loaddata', 'fixtures/meet_setup_mag/divisions.json')

            print('... loading team awards')
            call_command('loaddata', 'fixtures/meet_setup_mag/awards.json')

        print('')
        print('Initial meet setup is now complete')
