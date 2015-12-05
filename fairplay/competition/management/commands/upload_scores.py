import json
import os

from django.core.management.base import BaseCommand
import competition
import meet
import registration
import tempfile
from django.conf import settings


class Command(BaseCommand):
    """
    Example: $ ./manage.py upload_scores
    """
    def handle(self, *args, **kwargs):
        currentMeet = meet.models.Meet.objects.get(is_current_meet=True)
        currentSessions = competition.models.Session.objects.filter(meet=currentMeet)

        temp_dir = tempfile.mkdtemp()
        sessions = []

        for s in currentSessions:
            sessions.append({
                'name': s.name,
                'path': 'session_{}.json'.format(s.id)
            })

            teams = []

            for t in registration.models.Team.objects.all().order_by('team'):
                levels = []

                for l in registration.models.Level.objects.all():
                    athletes = []

                    for a in competition.models.Athlete.objects.filter(team=t, division__level=l, division__in=s.divisions.all()).order_by('last_name', 'first_name'):
                        scores = []
                        for e in competition.models.Event.objects.all():
                            ae = competition.models.AthleteEvent.objects.get(gymnast=a, event=e)
                            scores.append([e.initials.upper(), ae.score, ae.rank])
                        scores.append(["AA", a.overall_score, a.rank])

                        athlete = {
                            'id': a.athlete_id,
                            'division': a.division.name,
                            'last_name': a.last_name,
                            'first_name': a.first_name,
                            'scores': scores
                        }
                        athletes.append(athlete)

                    if len(athletes) > 0:
                        levels.append({'name': l.level, 'athletes': athletes})

                if len(levels) > 0:
                    teams.append({'name': t.team, 'levels': levels})

            session = {'name': s.name, 'teams': teams}

            with open(os.path.join(temp_dir, 'session_{}.json'.format(s.id)), 'w') as f:
                f.write(json.dumps(session))

        meetData = {
            'name': currentMeet.name,
            'sessions': sessions,
        }

        with open(os.path.join(temp_dir, 'meet.json'), 'w') as f:
            f.write(json.dumps(meetData))

        print(temp_dir)
