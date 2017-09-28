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
            call_command('loaddata', 'fixtures/events.json')

        # shirt sizes
        check = registration.models.ShirtSize.objects.all().count()
        if not check:
            print('... loading shirt sizes')
            call_command('loaddata', 'fixtures/shirtsizes.json')

        # led shows
        check = competition.models.LEDShow.objects.all().count()
        if not check:
            print('... loading led shows')
            call_command('loaddata', 'fixtures/ledshows.json')

        # led signs
        check = competition.models.LEDSign.objects.all().count()
        if not check:
            print('... loading led signs')
            call_command('loaddata', 'fixtures/ledsigns.json')

        # disciplines
        check = registration.models.Discipline.objects.all().count()
        if not check:
            print('... loading disciplines')
            call_command('loaddata', 'fixtures/disciplines.json')

        # if there is no meet in the database at all, set up an example one
        check = meet.models.Meet.objects.all().count()
        if not check:
            print('... loading example meet')
            call_command('loaddata', 'fixtures/meet.json')

            print('... loading levels')
            call_command('loaddata', 'fixtures/levels.json')

            print('... loading divisions')
            call_command('loaddata', 'fixtures/divisions.json')

            print('... loading team awards')
            call_command('loaddata', 'fixtures/awards.json')

            print('... associating levels to divisions and team awards')
            print('    Level 4')
            award = competition.models.TeamAward.objects.get(name="Level 4")
            level = registration.models.Level.objects.get(name='4 d1')
            award.levels.add(level)
            competition.models.Division.objects.filter(name="6 & up d1").update(level=level)

            level = registration.models.Level.objects.get(name='4 d2')
            award.levels.add(level)
            competition.models.Division.objects.filter(name="6 & up d2").update(level=level)

            print('    Level 5')
            award = competition.models.TeamAward.objects.get(name="Level 5")
            level = registration.models.Level.objects.get(name='5 d1')
            competition.models.Division.objects.filter(name="7 & up d1").update(level=level)

            level = registration.models.Level.objects.get(name='5 d2')
            award.levels.add(level)
            competition.models.Division.objects.filter(name="7 & up d2").update(level=level)

            print('    Level 6')
            award = competition.models.TeamAward.objects.get(name="Level 6")
            level = registration.models.Level.objects.get(name='6 d1')
            award.levels.add(level)
            competition.models.Division.objects.filter(name="8 & up d1").update(level=level)

            level = registration.models.Level.objects.get(name='6 d2')
            award.levels.add(level)
            competition.models.Division.objects.filter(name="8 & up d2").update(level=level)

            print('    Level 7')
            award = competition.models.TeamAward.objects.get(name="Level 7")
            level = registration.models.Level.objects.get(name='7 d1')
            award.levels.add(level)
            competition.models.Division.objects.filter(name="10 & up d1").update(level=level)

            level = registration.models.Level.objects.get(name='7 d2')
            award.levels.add(level)
            competition.models.Division.objects.filter(name="10 & up d2").update(level=level)

            print('    Level 8')
            award = competition.models.TeamAward.objects.get(name="Level 8")
            level = registration.models.Level.objects.get(name='8')
            award.levels.add(level)
            div = competition.models.Division.objects.filter(name="11 & up")[0]
            div.level = level
            div.save()

            print('    Level 9')
            award = competition.models.TeamAward.objects.get(name="Level 9/10")
            level = registration.models.Level.objects.get(name='9')
            award.levels.add(level)
            competition.models.Division.objects.filter(name="13 & up").update(level=level)

            print('    Level 10')
            level = registration.models.Level.objects.get(name='10')
            award.levels.add(level)
            competition.models.Division.objects.filter(name="15 & up").update(level=level)

            print('    Level JD')
            award = competition.models.TeamAward.objects.get(name="Level JD")
            level = registration.models.Level.objects.get(name='jd')
            award.levels.add(level)
            div = competition.models.Division.objects.filter(name="11 & up")[1]
            div.level = level
            div.save()

        print('')
        print('Initial meet setup is now complete')
