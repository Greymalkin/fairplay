import json
from datetime import datetime
import csv
import math
import logging

from django.views.generic import TemplateView

from rest_framework import viewsets
from . import models
from meet import models as meetconfig
from registration.models import Gymnast, Team, Coach
from . import serializers

from ledsign.bigdot import BigDot

from django.http import HttpResponse
from django.views.decorators.csrf import csrf_exempt

MEET, created = meetconfig.Meet.objects.get_or_create(is_current_meet=True,
                  defaults={'name': 'AUTO CREATED', 
                            'short_name': 'AUTO CREATED',
                            'host': 'AUTO CREATED',
                            'date': datetime.today(),})

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
    athletes = models.Athlete.objects.filter(meet=MEET).order_by('division', 'athlete_id').exclude(is_scratched=True, athlete_id=None)
    events = models.Event.objects.filter(meet=MEET)

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

        # go do the actual math
        # calculate_session_ranking(session)

        # start populating the context
        context['session'] = session
        context['divisions'] = []
        context['events'] = models.Event.objects.filter(meet=MEET)
        context['rankings'] = {}

        for division in session.divisions.all().order_by('level', 'min_age'):
            leaderboards = []

            # division per event leaderboard
            for event in models.Event.objects.filter(meet=MEET):
                event_leaderboard = []
                athlete_events = models.AthleteEvent.objects.filter(event=event, gymnast__division=division).order_by("rank")
                total_count = len(athlete_events)
                award_count = math.ceil(total_count * MEET.event_award_percentage)
                if total_count == 2:
                    award_count = 1

                for a in athlete_events[:award_count]:
                    if a.score is not None and a.score != 0:
                        event_leaderboard.append({
                            'athlete_id': a.gymnast.athlete_id,
                            'last_name': a.gymnast.last_name,
                            'first_name': a.gymnast.first_name,
                            'team': a.gymnast.team.team,
                            'score': a.score,
                            'rank': a.rank
                        })

                leaderboards.append({'event': event.name,
                                     'initials': event.initials,
                                     'level': division.level.level,
                                     'age_division': division.name,
                                     'athletes': event_leaderboard})

            # overall leaderboard for division
            aa_leaderboard = []
            athletes = models.Athlete.objects.filter(meet=MEET, division=division, is_scratched=False, overall_score__isnull=False).order_by("rank")
            total_count = len(athletes)
            award_count = math.ceil(total_count * MEET.all_around_award_percentage)

            if total_count == 2:
                award_count = 1

            for a in athletes[:award_count]:
                if a.overall_score is not None and a.overall_score != 0:
                    aa_leaderboard.append({
                        'athlete_id': a.athlete_id,
                        'last_name': a.last_name,
                        'first_name': a.first_name,
                        'team': a.team.team,
                        'score': a.overall_score,
                        'rank': a.rank
                    })
            leaderboards.append({'event': 'All Around',
                                 'initials': "aa",
                                 'level': division.level.level,
                                 'age_division': division.name,
                                 'athletes': aa_leaderboard})

            # individual leaderboards
            info = {}
            info['division'] = division
            info['rankings'] = leaderboards
            context['divisions'].append(info)

        team_awards = []
        for team_award in models.TeamAward.objects.filter(meet=MEET, divisions__in=session.divisions.all()).distinct():
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
        context['meet'] = MEET
        context['session'] = models.Session.objects.get(id=self.kwargs['id'])

        # calculate_session_ranking(context['session'])

        context['events'] = models.Event.objects.filter(meet=MEET)
        context['divisions'] = []
        for division in context['session'].divisions.all().order_by('min_age'):
            athletes = []
            for athlete in division.athletes.filter(rank__gt=0).order_by('rank'):
                events = []
                for athlete_event in models.AthleteEvent.objects.filter(gymnast=athlete).order_by('event__order'):
                    score = athlete_event.score
                    if score is None:
                        score = 0.0
                    events.append({'score': score, 'rank': athlete_event.rank})

                athletes.append({'info': athlete, 'events': events})
            context['divisions'].append({'info': division.title(), 'athletes': athletes})
        return context


class SessionTeamView(TemplateView):
    template_name = "team.html"

    def get_context_data(self, **kwargs):
        context = super(SessionTeamView, self).get_context_data(**kwargs)
        context['meet'] = MEET
        context['session'] = models.Session.objects.get(id=self.kwargs['id'])

        team_awards = []
        for team_award in models.TeamAward.objects.filter(divisions__in=context['session'].divisions.all()).distinct():
            tars = models.TeamAwardRank.objects.filter(team_award=team_award).order_by('rank')
            teams = []
            for t in tars[:math.ceil(tars.count() * team_award.award_percentage)]:
                teams.append({'name': t.team.team, 'score': t.score, 'rank': t.rank})

            team_awards.append({'id': team_award.id, 'name': team_award.name, 'teams': teams})

        # team leaderboards
        context['awards'] = team_awards

        print(context)

        return context


class SessionScoresheetView(TemplateView):
    template_name = 'scoresheet.html'

    def get_context_data(self, **kwargs):
        context = super(SessionScoresheetView, self).get_context_data(**kwargs)
        context['session'] = models.Session.objects.get(id=self.kwargs['id'])
        context['athletes'] = models.Athlete.objects.filter(meet=MEET, division__session=self.kwargs['id']).\
                                                order_by('team', 'division', 'last_name', 'first_name').\
                                                select_related()
        return context


class SessionLabelsView(TemplateView):
    template_name = 'label.html'

    def get_context_data(self, **kwargs):
        context = super(SessionLabelsView, self).get_context_data(**kwargs)
        context['session'] = models.Session.objects.get(id=self.kwargs['id'])
        context['athletes'] = models.Athlete.objects.filter(meet=MEET, division__session=self.kwargs['id']).\
                                                order_by('team', 'division', 'last_name', 'first_name').\
                                                select_related()
        context['teams'] = Team.objects.filter(meet=MEET, gymnasts__division__session=context['session']).\
                                                order_by('team').\
                                                distinct()
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
    lookup_field = 'athlete_id'


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


class CompetitionRosterView(TemplateView):
    pass


class WarmupScheduleView(TemplateView):
    pass


class SignInSheetView(TemplateView):
    pass


class CompetitionOrder(TemplateView):
    pass
