import competition
import json
import meet
import os
import signal
import time
import logging

from threading import Event

from django.conf import settings
from django.core.management.base import BaseCommand

from io import StringIO

logging.config.dictConfig({
    'version': 1,
    'disable_existing_loggers': False,  # this fixes the problem

    'formatters': {
        'standard': {
            'format': "%(asctime)s.%(msecs).03d %(levelname)s [%(module)s:%(lineno)s] %(message)s",
            'datefmt': "%Y-%m-%d %H:%M:%S"
        },
    },
    'handlers': {
        'default': {
            'level': 'INFO',
            'class': 'logging.StreamHandler',
            'formatter': 'standard',
        },
    },
    'loggers': {
        'manager': {
            'handlers': ['default'],
            'level': 'INFO',
            'propagate': False
        }
    }
})

logger = logging.getLogger('manager')


class Command(BaseCommand):
    help = 'Closes the specified poll for voting'

    def add_arguments(self, parser):
        parser.add_argument('session', nargs='+', type=str)

    def handle(self, *args, **options):
        try:
            self.running = True
            self.exit = Event()

            signal.signal(signal.SIGTERM, self.on_signal)
            signal.signal(signal.SIGINT, self.on_signal)
            self.session_names = options.get('session')

            while not self.exit.is_set():
                file_paths = self.generate_scores(self.session_names)
                self.upload_files(file_paths)
                self.exit.wait(settings.ONLINE_SCORES_RATE)

        except Exception as e:
            print("Could not send session {}!\nCheck to be sure it exists in the current meet.".format(', '.join(self.session_names)))

    def on_signal(self, sig, frame):
        self.exit.set()

    def generate_scores(self, session_names):
        currentMeet = meet.models.Meet.objects.filter(is_current_meet=True)[0]
        currentSessions = competition.models.Session.objects.filter(meet=currentMeet)

        session_info = []
        file_paths = []

        # handle overall data for meet
        for session in currentSessions:
            session_info.append([session.id, session.name, 'session_{}.json'.format(session.id)])

        meetData = {
            'name': currentMeet.name,
            'sessions': session_info,
        }

        file_path = 'meet.json'
        file_paths.append(file_path)
        with open(file_path, 'w') as f:
            f.write(json.dumps(meetData))

        # handle current session
        sessions = competition.models.Session.objects.filter(meet=currentMeet, name__in=session_names)

        for session in sessions:

            gymnast_events = competition.models.GymnastEvent.objects.filter(gymnast__division__session=session, gymnast__is_scratched=False).order_by(
                'gymnast__team',
                'gymnast__level',
                'gymnast__last_name',
                'gymnast__first_name',
                'event',)

            team = None
            level = None
            gymnast = None
            t = None
            l = None
            g = None
            teams = []

            for gymnast_event in gymnast_events:
                if gymnast_event.gymnast.team != team:
                    if team is not None:
                        g['scores'].append(['AA', gymnast.overall_score, gymnast.rank])
                        l['athletes'].append(g)  # TODO .atheletes -> change to gymnast
                        t['levels'].append(l)
                        teams.append(t)
                    team = gymnast_event.gymnast.team
                    level = None
                    gymnast = None
                    t = {'name': team.team, 'levels': []}

                if gymnast_event.gymnast.division.level != level:
                    if level is not None:
                        g['scores'].append(['AA', gymnast.overall_score, gymnast.rank])
                        l['athletes'].append(g)  # TODO .atheletes -> change to gymnast
                        t['levels'].append(l)
                    level = gymnast_event.gymnast.division.level
                    gymnast = None
                    l = {'name': level.name.upper(), 'athletes': []}  # TODO .athletes -> change to gymnast

                if gymnast_event.gymnast != gymnast:
                    if gymnast is not None:
                        g['scores'].append(['AA', gymnast.overall_score, gymnast.rank])
                        l['athletes'].append(g)  # TODO .atheletes -> change to gymnast
                    gymnast = gymnast_event.gymnast
                    g = {
                        'id': gymnast.athlete_id,
                        'division': gymnast.division.name,
                        'last_name': gymnast.last_name,
                        'first_name': gymnast.first_name,
                        'scores': []
                    }

                g['scores'].append([
                    gymnast_event.event.initials.upper(),
                    gymnast_event.score,
                    gymnast_event.rank])

            # make sure to append the last one
            g['scores'].append(['AA', gymnast.overall_score, gymnast.rank])
            l['athletes'].append(g)  # TODO .atheletes -> change to gymnast
            t['levels'].append(l)
            teams.append(t)
            s = {'name': session.name, 'teams': teams}

            session_path = 'session_{}.json'.format(session.id)
            file_paths.append(session_path)
            with open(session_path, 'w') as f:
                f.write(json.dumps(s))

        return file_paths

    def upload_files(self, file_paths):
        try:
            import paramiko
            key_string = StringIO(settings.ONLINE_SCORES_KEY)
            key = paramiko.RSAKey.from_private_key(key_string)
            transport = paramiko.Transport((settings.ONLINE_SCORES_HOST, settings.ONLINE_SCORES_PORT))

            transport.connect(None, settings.ONLINE_SCORES_USER, pkey=key)
            sftp = paramiko.SFTPClient.from_transport(transport)

            for file_path in file_paths:
                sftp.put(file_path, os.path.join(settings.ONLINE_SCORES_PATH, file_path + ".incoming"))

            for file_path in file_paths:
                try:
                    sftp.remove(os.path.join(settings.ONLINE_SCORES_PATH, file_path))
                except Exception:
                    pass
                sftp.rename(
                    os.path.join(settings.ONLINE_SCORES_PATH, file_path + ".incoming"),
                    os.path.join(settings.ONLINE_SCORES_PATH, file_path))

            sftp.close()
            transport.close()

            logger.info('Uploaded new scores for {}'.format(', '.join(self.session_names)))
        except Exception:
            logger.exception('Problem uploading scores for {}'.format(', '.join(self.session_names)))
