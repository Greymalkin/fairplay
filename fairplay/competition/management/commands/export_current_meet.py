import meet

from django.core.management import call_command
from django.core.management.base import BaseCommand


class Command(BaseCommand):
    """ Initial Setup can be called from a link that appears on the dashboard
        only when there are 0 Meets in the db """

    def handle(self, *args, **kwargs):
        m = meet.models.Meet.objects.filter(is_current_meet=True).get()
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

        # Might need to do a csv write of the Scores here, since the one-to-one field means it isn't easy (or possible?) to import them from a fixture
