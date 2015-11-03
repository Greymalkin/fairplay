import json
from datetime import datetime
import csv
import math
import logging

from django.views.generic import TemplateView

from rest_framework import viewsets
from . import models
from meet import models as meetconfig
from registration.models import Gymnast, Team
from . import serializers

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
    athletes = models.Athlete.objects.all().order_by('division', 'athlete_id').exclude(is_scratched=True, athlete_id=None)
    events = models.Event.objects.all()

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
            athlete.team.team,
            '' if not athlete.division else athlete.division.level,
            '' if not athlete.division else athlete.division.age_division,
            athlete.athlete_id,
            starting_event]

        for event in events:
            row.append(models.AthleteEvent.objects.get(gymnast=athlete,
                                                event=event).score)

        writer.writerow(row)

    return response


class SessionCeremonyView(TemplateView):
    template_name = "session_ceremony.html"

    def get_context_data(self, **kwargs):
        context = super(SessionCeremonyView, self).get_context_data(**kwargs)
        session = models.Session.objects.get(id=self.kwargs['id'])
        meet_settings = meetconfig.Meet.objects.get()

        # go do the actual math
        # calculate_session_ranking(session)

        # start populating the context
        context['session'] = session
        context['divisions'] = []
        context['events'] = models.Event.objects.all()
        context['rankings'] = {}

        for division in session.divisions.all().order_by('min_age'):
            leaderboards = []

            # division per event leaderboard
            for event in models.Event.objects.all():
                leaderboard = []
                athlete_events = models.AthleteEvent.objects.filter(event=event, athlete__division=division).order_by("rank")
                total_count = len(athlete_events)
                award_count = math.ceil(total_count * meet_settings.event_award_percentage)
                if total_count == 2:
                    award_count = 1

                print('{} {} rankings for {} places out of {} total'.format(division, event.name, award_count, total_count))

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
                                     'level': division.level,
                                     'age_division': division.age_division,
                                     'athletes': leaderboard})

            # overall leaderboard for division
            leaderboard = []
            athletes = models.Athlete.objects.filter(division=division, scratched=False, overall_score__isnull=False).order_by("rank")
            total_count = len(athletes)
            award_count = math.ceil(total_count * meet_settings.all_around_award_percentage)

            if total_count == 2:
                award_count = 1

            print('{} All-Around rankings for {} places out of {} total'.format(division, award_count, total_count))

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
                                 'level': division.level,
                                 'age_division': division.age_division,
                                 'athletes': leaderboard})

            # individual leaderboards
            info = {}
            info['division'] = division
            info['rankings'] = leaderboards
            context['divisions'].append(info)

        team_awards = []
        for team_award in models.TeamAward.objects.filter(divisions__in=session.divisions.all()).distinct():
            tars = models.TeamAwardRank.objects.filter(team_award=team_award).order_by('rank')
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
        context['meet'] = meetconfig.Meet.objects.get()
        context['session'] = models.Session.objects.get(id=self.kwargs['id'])

        # calculate_session_ranking(context['session'])

        context['events'] = models.Event.objects.all()
        context['divisions'] = []
        for division in context['session'].divisions.all().order_by('order'):
            athletes = []
            for athlete in division.athletes.filter(rank__gt=0).order_by('rank'):
                events = []
                for athlete_event in models.AthleteEvent.objects.filter(athlete=athlete).order_by('event__order'):
                    score = athlete_event.score
                    if score is None:
                        score = 0.0
                    events.append({'score': score, 'rank': athlete_event.rank})

                athletes.append({'info': athlete, 'events': events})
            context['divisions'].append({'info': division, 'athletes': athletes})

        return context


class SessionTeamView(TemplateView):
    template_name = "team.html"

    def get_context_data(self, **kwargs):
        context = super(SessionTeamView, self).get_context_data(**kwargs)
        context['meet'] = meetconfig.Meet.objects.get()
        context['session'] = models.Session.objects.get(id=self.kwargs['id'])

        # calculate_session_ranking(context['session'])

        team_awards = []
        for team_award in models.TeamAward.objects.filter(divisions__in=context['session'].divisions.all()).distinct():
            tars = models.TeamAwardRank.objects.filter(team_award=team_award).order_by('rank')
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
    queryset = models.Event.objects.all()
    serializer_class = serializers.EventSerializer


class TeamViewSet(viewsets.ReadOnlyModelViewSet):
    """
    This viewset automatically provides `list` and `detail` actions.
    """
    queryset = Team.objects.all()
    serializer_class = serializers.TeamSerializer


class AthleteViewSet(viewsets.ReadOnlyModelViewSet):
    """
    This viewset automatically provides `list` and `detail` actions.
    """
    queryset = models.Athlete.objects.all()
    serializer_class = serializers.AthleteSerializer


class AthleteEventViewSet(viewsets.ModelViewSet):
    """
    This viewset automatically provides `list` and `detail` actions.
    """
    queryset = models.AthleteEvent.objects.all()
    serializer_class = serializers.AthleteEventSerializer


class MessageViewSet(viewsets.ReadOnlyModelViewSet):
    """
    This viewset automatically provides `list` and `detail` actions.
    """
    queryset = models.Message.objects.all()
    serializer_class = serializers.MessageSerializer


class SessionViewSet(viewsets.ReadOnlyModelViewSet):
    """
    This viewset automatically provides `list` and `detail` actions.
    """
    queryset = models.Session.objects.all()
    serializer_class = serializers.SessionSerializer


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
