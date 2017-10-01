# import csv
import os
from meet.models import Meet
# from competition.models import ScoreRankEvent

from django.conf import settings
from django.core.management import call_command
from django.core.management.base import BaseCommand


class Command(BaseCommand):
    """ Export the fixtures associated with the current active meet in the db"""

    def handle(self, *args, **kwargs):
        dirname = os.path.dirname(settings.BASE_DIR)
        try:
            os.mkdir(os.path.join(dirname, 'fixtures/current_meet'))
        except Exception:
            pass

        # write csv of the Scores, since the one-to-one relationship with Gymnast means it isn't easy (or possible?) to import them from a fixture
        # opts = ScoreRankEvent._meta
        # destination_file_path = os.path.join(dirname, "fixtures/current_meet/scorerankevent.csv")
        # # Create file in the fixtures directory and write to it
        # with open(destination_file_path, "w") as fw:
        #     writer = csv.writer(fw)
        #     field_names = [field.name for field in opts.fields]
        #     # Write a first row with header information
        #     writer.writerow(field_names)

        #     # Write data rows
        #     for obj in ScoreRankEvent.objects.all():
        #         writer.writerow([getattr(obj, field) for field in field_names])

        #     fw.close()

        m = Meet.objects.filter(is_current_meet=True).get()
        call_command('dumpdata', 'meet.Meet', '--pks={}'.format(m.id), '--format=json', '--output=fixtures/current_meet/meet.json', '--indent=4', '--natural-primary', '--natural-foreign')
        call_command('dumpdata', 'registration.ShirtSize', '--format=json', '--output=fixtures/current_meet/shirtsize.json', '--indent=4', '--natural-primary', '--natural-foreign')
        call_command('dumpdata', 'registration.Discipline', '--format=json', '--output=fixtures/current_meet/discipline.json', '--indent=4', '--natural-primary', '--natural-foreign')
        call_command('dumpdata', 'competition.Event', '--format=json', '--output=fixtures/current_meet/event.json', '--indent=4', '--natural-primary', '--natural-foreign')
        call_command('dumpdata', 'competition.LEDSign', '--format=json', '--output=fixtures/current_meet/sign.json', '--indent=4', '--natural-primary', '--natural-foreign')
        call_command('dumpdata', 'competition.LEDShow', '--format=json', '--output=fixtures/current_meet/show.json', '--indent=4', '--natural-primary', '--natural-foreign')
        call_command('dumpdata', 'competition.LEDShowMessage', '--format=json', '--output=fixtures/current_meet/showmessage.json', '--indent=4', '--natural-primary', '--natural-foreign')
        call_command('dumpdata', 'registration.Level', '--format=json', '--output=fixtures/current_meet/level.json', '--indent=4', '--natural-primary', '--natural-foreign')
        call_command('dumpdata', 'competition.Division', '--format=json', '--output=fixtures/current_meet/division.json', '--indent=4', '--natural-primary', '--natural-foreign')
        call_command('dumpdata', 'competition.Session', '--format=json', '--output=fixtures/current_meet/session.json', '--indent=4', '--natural-primary', '--natural-foreign')
        call_command('dumpdata', 'competition.TeamAward', '--format=json', '--output=fixtures/current_meet/teamaward.json', '--indent=4', '--natural-primary', '--natural-foreign')
        call_command('dumpdata', 'registration.Team', '--format=json', '--output=fixtures/current_meet/team.json', '--indent=4', '--natural-primary', '--natural-foreign')
        call_command('dumpdata', 'competition.TeamAwardRank', '--format=json', '--output=fixtures/current_meet/teamawardrank.json', '--indent=4', '--natural-primary', '--natural-foreign')
        call_command('dumpdata', 'registration.Coach', '--format=json', '--output=fixtures/current_meet/coach.json', '--indent=4', '--natural-primary', '--natural-foreign')
        call_command('dumpdata', 'registration.Gymnast', '--format=json', '--output=fixtures/current_meet/gymnast.json', '--indent=4', '--natural-primary', '--natural-foreign')
        call_command('dumpdata', 'competition.GymnastEvent', '--format=json', '--output=fixtures/current_meet/gymnastevent.json', '--indent=4', '--natural-primary', '--natural-foreign')
        call_command('dumpdata', 'competition.TeamAwardRankEvent', '--format=json', '--output=fixtures/current_meet/teamawardrankevent.json', '--indent=4', '--natural-primary', '--natural-foreign')
        call_command('dumpdata', 'registration.TeamNotes', '--format=json', '--output=fixtures/current_meet/teamnotes.json', '--indent=4', '--natural-primary', '--natural-foreign')
        call_command('dumpdata', 'registration.GymnastNotes', '--format=json', '--output=fixtures/current_meet/gymnastnotes.json', '--indent=4', '--natural-primary', '--natural-foreign')
        call_command('dumpdata', 'registration.Payments', '--format=json', '--output=fixtures/current_meet/payments.json', '--indent=4', '--natural-primary', '--natural-foreign')
        call_command('dumpdata', 'competition.ScoreRankEvent', '--format=json', '--output=fixtures/current_meet/scores.json', '--indent=4', '--natural-primary', '--natural-foreign')
