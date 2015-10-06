import json
from datetime import datetime
import csv
import math
import logging

from django.views.generic import TemplateView

from rest_framework import viewsets
from .models import Event, Team, Athlete, AthleteEvent, Message, Session, TeamAward, TeamAwardRank, MeetSettings
from .serializers import (
    EventSerializer,
    TeamSerializer,
    AthleteSerializer,
    AthleteEventSerializer,
    MessageSerializer,
    SessionSerializer,
)

from ledsign.bigdot import BigDot

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
    athletes = Athlete.objects.all().order_by('group', 'athlete_id').exclude(scratched=True)
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
        if athlete.starting_event:
            starting_event = athlete.starting_event.initials
        else:
            starting_event = ""
        row = [
            athlete.first_name,
            athlete.last_name,
            athlete.team.name,
            athlete.group.level,
            athlete.group.age_group,
            athlete.athlete_id,
            starting_event]

        for event in events:
            row.append(AthleteEvent.objects.get(athlete=athlete,
                                                event=event).score)

        writer.writerow(row)

    return response


class SessionCeremonyView(TemplateView):
    template_name = "session_ceremony.html"

    def get_context_data(self, **kwargs):
        context = super(SessionCeremonyView, self).get_context_data(**kwargs)
        session = Session.objects.get(id=self.kwargs['id'])
        meet_settings = MeetSettings.objects.get()

        # go do the actual math
        # calculate_session_ranking(session)

        # start populating the context
        context['session'] = session
        context['groups'] = []
        context['events'] = Event.objects.all()
        context['rankings'] = {}

        for group in session.groups.all().order_by('order'):
            leaderboards = []

            # group per event leaderboard
            for event in Event.objects.all():
                leaderboard = []
                athlete_events = AthleteEvent.objects.filter(event=event, athlete__group=group).order_by("rank")
                total_count = len(athlete_events)
                award_count = math.ceil(total_count * meet_settings.event_award_percentage)
                if total_count == 2:
                    award_count = 1

                print('{} {} rankings for {} places out of {} total'.format(group, event.name, award_count, total_count))

                for a in athlete_events[:award_count]:
                    if a.score is not None and a.score != 0:
                        leaderboard.append({
                            'athlete_id': a.athlete.athlete_id,
                            'last_name': a.athlete.last_name,
                            'first_name': a.athlete.first_name,
                            'team': a.athlete.team.name,
                            'score': a.score,
                            'rank': a.rank
                        })

                leaderboards.append({'event': event.name,
                                     'initials': event.initials,
                                     'level': group.level,
                                     'age_group': group.age_group,
                                     'athletes': leaderboard})

            # overall leaderboard for group
            leaderboard = []
            athletes = Athlete.objects.filter(group=group, scratched=False, overall_score__isnull=False).order_by("rank")
            total_count = len(athletes)
            award_count = math.ceil(total_count * meet_settings.all_around_award_percentage)

            if total_count == 2:
                award_count = 1

            print('{} All-Around rankings for {} places out of {} total'.format(group, award_count, total_count))

            for a in athletes[:award_count]:
                if a.overall_score is not None and a.overall_score != 0:
                    leaderboard.append({
                        'athlete_id': a.athlete_id,
                        'last_name': a.last_name,
                        'first_name': a.first_name,
                        'team': a.team.name,
                        'score': a.overall_score,
                        'rank': a.rank
                    })
            leaderboards.append({'event': 'Overall',
                                 'initials': "overall",
                                 'level': group.level,
                                 'age_group': group.age_group,
                                 'athletes': leaderboard})

            # individual leaderboards
            info = {}
            info['group'] = group
            info['rankings'] = leaderboards
            context['groups'].append(info)

        team_awards = []
        for team_award in TeamAward.objects.filter(groups__in=session.groups.all()).distinct():
            tars = TeamAwardRank.objects.filter(team_award=team_award).order_by('rank')
            teams = []
            for t in tars[:math.ceil(tars.count() * team_award.award_percentage)]:
                teams.append({'name': t.team.name, 'score': t.score, 'rank': t.rank})

            team_awards.append({'id': team_award.id, 'award': team_award.name, 'teams': teams})

        # team leaderboards
        context['teams'] = team_awards

        return context


class SessionIndividualView(TemplateView):
    template_name = "individual.html"

    def get_context_data(self, **kwargs):
        context = super(SessionIndividualView, self).get_context_data(**kwargs)
        context['meet'] = MeetSettings.objects.get()
        context['session'] = Session.objects.get(id=self.kwargs['id'])

        # calculate_session_ranking(context['session'])

        context['events'] = Event.objects.all()
        context['groups'] = []
        for group in context['session'].groups.all().order_by('order'):
            athletes = []
            for athlete in group.athletes.filter(rank__gt=0).order_by('rank'):
                events = []
                for athlete_event in AthleteEvent.objects.filter(athlete=athlete).order_by('event__order'):
                    score = athlete_event.score
                    if score is None:
                        score = 0.0
                    events.append({'score': score, 'rank': athlete_event.rank})

                athletes.append({'info': athlete, 'events': events})
            context['groups'].append({'info': group, 'athletes': athletes})

        return context


class SessionTeamView(TemplateView):
    template_name = "team.html"

    def get_context_data(self, **kwargs):
        context = super(SessionTeamView, self).get_context_data(**kwargs)
        context['meet'] = MeetSettings.objects.get()
        context['session'] = Session.objects.get(id=self.kwargs['id'])

        # calculate_session_ranking(context['session'])

        team_awards = []
        for team_award in TeamAward.objects.filter(groups__in=context['session'].groups.all()).distinct():
            tars = TeamAwardRank.objects.filter(team_award=team_award).order_by('rank')
            teams = []
            for t in tars[:math.ceil(tars.count() * team_award.award_percentage)]:
                teams.append({'name': t.team.name, 'score': t.score, 'rank': t.rank})

            team_awards.append({'id': team_award.id, 'name': team_award.name, 'teams': teams})

        # team leaderboards
        context['awards'] = team_awards

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


class ScorecardView(TemplateView):
    pass


class CompetitionRosterView(TemplateView):
    pass


class WarmupScheduleView(TemplateView):
    pass


class SignInSheetView(TemplateView):
    pass


class CompetitionOrder(TemplateView):
    pass
