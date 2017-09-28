from django.core.management import call_command
from django.core.management.base import BaseCommand


class Command(BaseCommand):
    """ Initial Setup can be called from a link that appears on the dashboard
        only when there are 0 Meets in the db """

    def handle(self, *args, **kwargs):
        call_command('loaddata', 'fixtures/curent_meet/meet.json')
        call_command('loaddata', 'fixtures/curent_meet/shirtsize.json')
        call_command('loaddata', 'fixtures/curent_meet/discipline.json')
        call_command('loaddata', 'fixtures/curent_meet/event.json')
        call_command('loaddata', 'fixtures/curent_meet/sign.json')
        call_command('loaddata', 'fixtures/curent_meet/show.json')
        call_command('loaddata', 'fixtures/curent_meet/showmessage.json')
        call_command('loaddata', 'fixtures/curent_meet/level.json')
        call_command('loaddata', 'fixtures/curent_meet/division.json')
        call_command('loaddata', 'fixtures/curent_meet/session.json')
        call_command('loaddata', 'fixtures/curent_meet/teamaward.json')
        call_command('loaddata', 'fixtures/curent_meet/team.json')
        call_command('loaddata', 'fixtures/curent_meet/teamawardrank.json')
        call_command('loaddata', 'fixtures/curent_meet/coach.json')
        call_command('loaddata', 'fixtures/curent_meet/gymnast.json')
        call_command('loaddata', 'fixtures/curent_meet/gymnastevent.json')
        call_command('loaddata', 'fixtures/curent_meet/teamawardrankevent.json')
        call_command('loaddata', 'fixtures/curent_meet/teamnotes.json')
        call_command('loaddata', 'fixtures/curent_meet/gymnastnotes.json')
        call_command('loaddata', 'fixtures/curent_meet/payments.json')
