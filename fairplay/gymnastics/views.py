import json
from datetime import datetime
import csv

from django.views.generic import TemplateView

from rest_framework import viewsets
from .models import Event, Team, Athlete, AthleteEvent, Message, Session
from .serializers import (
    EventSerializer,
    TeamSerializer,
    AthleteSerializer,
    AthleteEventSerializer,
    MessageSerializer,
    SessionSerializer,
)

from ledsign.bigdot import BigDot

from django.db.models import Sum, Max
from django.http import HttpResponse
from django.views.decorators.csrf import csrf_exempt


@csrf_exempt
def led_sign(request):
    data = json.loads(request.body.decode())

    if 'device' in data and 'message' in data:
        try:
            sign = BigDot(data['device'])
            sign.show_message(data['message'])
        except:
            response = {'success': False, 'reason': 'could not send to sign'}

    else:
        response = {'success': False, 'reason': 'missing data'}

    response = {'success': True}

    return HttpResponse(json.dumps(response), content_type="application/json")


@csrf_exempt
def download_roster(request):
    athletes = Athlete.objects.all().order_by('group', 'athlete_id')
    events = Event.objects.all()

    response = HttpResponse(content_type='text/csv')
    timestamp = datetime.now().strftime('%Y-%m-%d-%H-%M')
    # force download.
    response['Content-Disposition'] = 'attachment;filename=roster_'+timestamp+'.csv'
    # the csv writer
    writer = csv.writer(response)

    header = ['firstname',
              'lastname',
              'gym',
              'levelid',
              'agediv',
              'compno',
              'startevent', ]

    header += [e.initials for e in events]

    writer.writerow(header)

    for athlete in athletes:
        row = [
            athlete.first_name,
            athlete.last_name,
            athlete.team.name,
            athlete.group.level,
            athlete.group.age_group,
            athlete.athlete_id,
            athlete.starting_event.initials]

        for event in events:
            row.append(AthleteEvent.objects.get(athlete=athlete,
                                                event=event).score)

        writer.writerow(row)

    return response


def multikeysort(items, columns):
    from operator import itemgetter
    comparers = [ ((itemgetter(col[1:].strip()), -1) if col.startswith('-') else (itemgetter(col.strip()), 1)) for col in columns]
    def comparer(left, right):
        for fn, mult in comparers:
            result = cmp(fn(left), fn(right))
            if result:
                return mult * result
        else:
            return 0
    return sorted(items, cmp=comparer)


class SessionLeaderboardView(TemplateView):
    template_name = "session_leaderboard.html"

    def get_context_data(self, **kwargs):
        context = super(SessionLeaderboardView, self).get_context_data(**kwargs)

        session = Session.objects.get(id=self.kwargs['id'])
        leaderboards = []

        for group in session.groups.all():

            for event in Event.objects.all():
                athletes = []
                for a in AthleteEvent.objects.filter(event=event, athlete__group=group):
                    athlete = {
                        'athlete_id': a.athlete.athlete_id,
                        'last_name': a.athlete.last_name,
                        'first_name': a.athlete.first_name,
                        'team': a.athlete.team.name,
                        'score': a.score,
                    }
                    info = AthleteEvent.objects.filter(athlete=a.athlete).aggregate(total_score=Sum('score'), max_score=Max('score'))
                    athlete['total_score'] = info['total_score']
                    athlete['max_score'] = info['max_score']
                    athletes.append(athlete)

                athletes = multikeysort(athletes, ('score', 'total_score', 'max_score'))
                athletes.reverse()
                leaderboards.append({'event': event.name,
                                     'level': group.level,
                                     'age_group': group.age_group,
                                     'athletes': athletes})

            athletes = multikeysort(athletes, ('total_score', 'max_score'))
            athletes.reverse()
            leaderboards.append({'event': 'Overall',
                                 'level': group.level,
                                 'age_group': group.age_group,
                                 'athletes': athletes})

        context['individual'] = leaderboards

        return context

class EventViewSet(viewsets.ReadOnlyModelViewSet):
    """
    This viewset automatically provides `list` and `detail` actions.
    """
    queryset = Event.objects.all()
    serializer_class = EventSerializer


class TeamViewSet(viewsets.ReadOnlyModelViewSet):
    """
    This viewset automatically provides `list` and `detail` actions.
    """
    queryset = Team.objects.all()
    serializer_class = TeamSerializer


class AthleteViewSet(viewsets.ReadOnlyModelViewSet):
    """
    This viewset automatically provides `list` and `detail` actions.
    """
    queryset = Athlete.objects.all()
    serializer_class = AthleteSerializer


class AthleteEventViewSet(viewsets.ModelViewSet):
    """
    This viewset automatically provides `list` and `detail` actions.
    """
    queryset = AthleteEvent.objects.all()
    serializer_class = AthleteEventSerializer


class MessageViewSet(viewsets.ReadOnlyModelViewSet):
    """
    This viewset automatically provides `list` and `detail` actions.
    """
    queryset = Message.objects.all()
    serializer_class = MessageSerializer


class SessionViewSet(viewsets.ReadOnlyModelViewSet):
    """
    This viewset automatically provides `list` and `detail` actions.
    """
    queryset = Session.objects.all()
    serializer_class = SessionSerializer
