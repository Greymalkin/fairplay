import json
from datetime import datetime
import csv

from django.conf import settings
from django.views.generic import TemplateView


from rest_framework import viewsets

from meet import models as meetconfig
from registration.models import Team, Coach, Level
from . import models
from . import serializers
from . import ranking

from ledsign.bigdot import BigDotUDP

from django.http import HttpResponse
from django.views.decorators.csrf import csrf_exempt

MEET, created = meetconfig.Meet.objects.get_or_create(
    is_current_meet=True,
    defaults={
        'name': 'AUTO CREATED',
        'short_name': 'AUTO CREATED',
        'host': 'AUTO CREATED',
        'date': datetime.today(), })


@csrf_exempt
def led_sign(request):
    print(request.body.decode())
    data = json.loads(request.body.decode())

    if 'device' in data and 'message' in data:
        try:
            sign = BigDotUDP(settings.LED_SIGN_HOST, settings.LED_SIGN_PORT)
            sign.show_message(data['device'], data['message'])
        except:
            response = {'success': False, 'reason': 'could not send to sign'}

    elif 'device' in data:
        try:
            sign = BigDotUDP(settings.LED_SIGN_HOST, settings.LED_SIGN_PORT)
            sign.set_address(data['device'])
        except:
            response = {'success': False, 'reason': 'could not set sign address'}

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
        row = [
            athlete.first_name,
            athlete.last_name,
            athlete.team.team,
            '' if not athlete.division else athlete.division.level,
            '' if not athlete.division else athlete.division.short_name,
            athlete.athlete_id,
            '' if not athlete.starting_event else athlete.starting_event.initials]

        for event in events:
            row.append(models.AthleteEvent.objects.get(gymnast=athlete,
                                                       event=event).score)

        writer.writerow(row)

    return response


@csrf_exempt
def download_athlete_labels(request):
    athletes = models.Athlete.objects.filter(meet=MEET).\
        exclude(is_scratched=True, athlete_id=None).\
        order_by('division__session', 'team', 'division', 'last_name', 'first_name').\
        select_related()

    response = HttpResponse(content_type='text/csv')
    timestamp = datetime.now().strftime('%Y-%m-%d-%H-%M')
    # force download.
    response['Content-Disposition'] = 'attachment;filename=labels_'+timestamp+'.csv'
    # the csv writer
    writer = csv.writer(response)

    writer.writerow([
        'ID',
        'First Name',
        'Last Name',
        'Team',
        'Level',
        'Division',
        'Session'
    ])

    for athlete in athletes:
        writer.writerow([
            athlete.athlete_id,
            athlete.first_name,
            athlete.last_name,
            athlete.team.team,
            athlete.level,
            athlete.division.short_name,
            athlete.division.session.first().name
        ])

    return response


@csrf_exempt
def download_team_labels(request):
    sessions = models.Session.objects.filter(meet=MEET)

    response = HttpResponse(content_type='text/csv')
    timestamp = datetime.now().strftime('%Y-%m-%d-%H-%M')
    # force download.
    response['Content-Disposition'] = 'attachment;filename=labels_'+timestamp+'.csv'
    # the csv writer
    writer = csv.writer(response)

    writer.writerow([
        'Team',
        'Session',
        'Levels',
    ])


    for session in sessions:
        levels = ','.join(sorted(session.levels))

        teams = Team.objects.filter(meet=MEET, gymnasts__division__session=session).\
            order_by('gymnasts__division__session', 'team').distinct()

        for team in teams:
            writer.writerow([
                team.team,
                session.name,
                levels
            ])

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
                # award_count = math.ceil(total_count * MEET.event_award_percentage)
                award_count = division.event_award_count
                if total_count == 2:
                    award_count = 1

                for a in athlete_events[:award_count]:
                    if a.score is not None and a.score != 0:
                        event_leaderboard.append({
                            'athlete_id': a.gymnast.athlete_id,
                            'name': '{} {}.'.format(a.gymnast.first_name, a.gymnast.last_name[0]),
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
            # award_count = math.ceil(total_count * MEET.all_around_award_percentage)
            award_count = division.all_around_award_count

            if total_count == 2:
                award_count = 1

            for a in athletes[:award_count]:
                if a.overall_score is not None and a.overall_score != 0:
                    aa_leaderboard.append({
                        'athlete_id': a.athlete_id,
                        'name': '{} {}.'.format(a.first_name, a.last_name[0]),
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

        session_levels = []
        for division in context['session'].divisions.all():
            if division.level not in session_levels:
                session_levels.append(division.level)

        team_awards = []
        for team_award in models.TeamAward.objects.filter(meet=MEET, levels__in=session_levels).distinct():
            ranking.update_team_ranking(team_award)

            tars = models.TeamAwardRank.objects.filter(team_award=team_award).order_by('rank')
            teams = []
            # for t in tars[:math.ceil(tars.count() * team_award.award_percentage)]:
            for t in tars[:team_award.award_count]:
                teams.append({'name': t.team.team, 'score': t.score, 'rank': t.rank})

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
        for division in context['session'].divisions.all().order_by('level', 'min_age'):
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

        session_levels = []
        for division in context['session'].divisions.all():
            if division.level not in session_levels:
                session_levels.append(division.level)

        team_awards = []
        events = models.Event.objects.all()
        context['events'] = events
        context['width'] = 200 + 60 * len(events)
        for team_award in models.TeamAward.objects.filter(levels__in=session_levels).distinct():

            ranking.update_team_ranking(team_award)

            tars = models.TeamAwardRank.objects.filter(team_award=team_award).order_by('rank')
            teams = []
            dq_teams = []
            # for t in tars[:math.ceil(tars.count() * team_award.award_percentage)]:
            for tar in tars:
                team = {
                    'name': tar.team.team,
                    'score': tar.score,
                    'rank': tar.rank,
                    'gymnasts': []}

                if tar.rank is not None:
                    gymnasts = models.Gymnast.objects.filter(events__team_award_rankings__team_award_rank=tar).distinct()

                    for gymnast in gymnasts:
                        scores = []
                        for event in events:
                            tarae = models.TeamAwardRankAthleteEvent.objects.filter(team_award_rank=tar, event=event, athlete_event__gymnast=gymnast)

                            if len(tarae) == 1:
                                scores.append(tarae[0].athlete_event.score)
                            else:
                                scores.append('')

                        team['gymnasts'].append({'gymnast': gymnast, 'scores': scores})

                    teams.append(team)
                else:
                    dq_teams.append(team['name'])

            team_awards.append({'id': team_award.id, 'name': team_award.name, 'teams': teams, 'dq_teams': ', '.join(dq_teams)})

        # team leaderboards
        context['awards'] = team_awards

        return context


class SessionScoresheetView(TemplateView):
    template_name = 'scoresheet.html'

    def get_context_data(self, **kwargs):
        context = super(SessionScoresheetView, self).get_context_data(**kwargs)
        context['session'] = models.Session.objects.get(id=self.kwargs['id'])
        context['athletes'] = models.Athlete.objects.filter(division__session=self.kwargs['id']).\
                                                order_by('team', 'division', 'last_name', 'first_name').\
                                                select_related()
        return context


class SessionAllTeamsRosterView(SessionScoresheetView):
    template_name = 'roster_allteams.html'


class SessionTeamRosterView(SessionScoresheetView):
    template_name = 'roster_team.html'


class SessionGymnastSignInView(TemplateView):
    template_name = 'gymnast-signin.html'

    def get_context_data(self, **kwargs):
        context = super(SessionGymnastSignInView, self).get_context_data(**kwargs)
        context['session'] = models.Session.objects.get(id=self.kwargs['id'])
        context['gymnasts'] = models.Athlete.objects.filter(division__session=self.kwargs['id']).\
                                                order_by('team', 'last_name', 'first_name')
        return context


class SessionRotationView(TemplateView):
    template_name = 'rotations.html'

    def get_context_data(self, **kwargs):
        context = super(SessionRotationView, self).get_context_data(**kwargs)
        context['session'] = models.Session.objects.get(id=self.kwargs['id'])
        context['events'] = []
        context['warmup'] = []
        context['teams'] = []
        for event in models.Event.objects.filter(meet=MEET):
            event_info = {}
            event_info['event'] = event
            event_info['warmup'] = []
            event_info['rotation'] = []

            for team in self.teams_on_event(context['session'], event):
                team_info = {}
                team_info['team'] = team
                team_info['divisions'] = self.divisions_in_rotation(context['session'], event, team)
                team_info['levels'] = self.levels_in_rotation(context['session'], event, team)
                event_info['rotation'].append(team_info)

            for team in self.teams_on_event(context['session'], event.warmup_event_endhere):
                team_info = {}
                team_info['team'] = team
                team_info['divisions'] = self.divisions_in_rotation(context['session'], event.warmup_event_endhere, team)
                team_info['levels'] = self.levels_in_rotation(context['session'], event.warmup_event_endhere, team)
                event_info['warmup'].append(team_info)
            context['events'].append(event_info)
        for team in self.teams_in_session(context['session']):
            team_info = {}
            team_info['team'] = team
            team_info['starting_events'] = self.team_starting_events(context['session'], team)
            context['teams'].append(team_info)
        return context

    def teams_on_event(self, session, event):
        teams = Team.objects.filter(gymnasts__division__session=session, gymnasts__starting_event=event, gymnasts__is_scratched=False).distinct()
        return teams

    def divisions_in_rotation(self, session, event, team):
        divisions = models.Division.objects.filter(session=session, athletes__team=team, athletes__starting_event=event, athletes__is_scratched=False).distinct()
        return divisions

    def levels_in_rotation(self, session, event, team):
        levels = Level.objects.filter(divisions__session=session, divisions__athletes__team=team, divisions__athletes__starting_event=event).distinct()
        return levels

    def teams_in_session(self, session):
        teams = Team.objects.filter(gymnasts__division__session=session, gymnasts__is_scratched=False).distinct()
        return teams

    def team_starting_events(self, session, team):
        events = team.gymnasts.filter(division__session=session, is_scratched=False).distinct('starting_event').order_by()
        return events


class SessionAnnouncerView(TemplateView):
    template_name = 'announce_rotation.html'

    def get_context_data(self, **kwargs):
        context = super(SessionAnnouncerView, self).get_context_data(**kwargs)
        context['session'] = models.Session.objects.get(id=self.kwargs['id'])
        context['events'] = []
        context['warmup'] = []
        context['teams'] = []
        for event in models.Event.objects.filter(meet=MEET):
            event_info = {}
            event_info['event'] = event
            event_info['warmup'] = []
            event_info['rotation'] = []

            for team in self.teams_on_event(context['session'], event):
                team_info = {}
                team_info['team'] = team
                team_info['divisions'] = self.divisions_in_rotation(context['session'], event, team)
                team_info['levels'] = self.levels_in_rotation(context['session'], event, team)
                event_info['rotation'].append(team_info)

            for team in self.teams_on_event(context['session'], event.warmup_event_endhere):
                team_info = {}
                team_info['team'] = team
                team_info['divisions'] = self.divisions_in_rotation(context['session'], event.warmup_event_endhere, team)
                team_info['levels'] = self.levels_in_rotation(context['session'], event.warmup_event_endhere, team)
                event_info['warmup'].append(team_info)
            context['events'].append(event_info)
        for team in self.teams_in_session(context['session']):
            team_info = {}
            team_info['team'] = team
            team_info['starting_events'] = self.team_starting_events(context['session'], team)
            context['teams'].append(team_info)
        return context

    def teams_on_event(self, session, event):
        teams = Team.objects.filter(gymnasts__division__session=session, gymnasts__starting_event=event, gymnasts__is_scratched=False).distinct()
        return teams

    def divisions_in_rotation(self, session, event, team):
        divisions = models.Division.objects.filter(session=session, athletes__team=team, athletes__starting_event=event, athletes__is_scratched=False).distinct()
        return divisions

    def levels_in_rotation(self, session, event, team):
        levels = Level.objects.filter(divisions__session=session, divisions__athletes__team=team, divisions__athletes__starting_event=event).distinct()
        return levels

    def teams_in_session(self, session):
        teams = Team.objects.filter(gymnasts__division__session=session, gymnasts__is_scratched=False).distinct()
        return teams

    def team_starting_events(self, session, team):
        events = team.gymnasts.filter(division__session=session, is_scratched=False).distinct('starting_event').order_by()
        return events



class SessionCoachHospitalityView(TemplateView):
    template_name = 'coach_hospitality.html'

    def get_context_data(self, **kwargs):
        context = super(SessionCoachHospitalityView, self).get_context_data(**kwargs)
        context['session'] = models.Session.objects.get(id=self.kwargs['id'])

        return context



class CoachSignInView(TemplateView):
    template_name = 'coach-signin.html'

    def get_context_data(self, **kwargs):
        context = super(CoachSignInView, self).get_context_data(**kwargs)
        context['meet'] = MEET
        context['coaches'] = Coach.objects.filter(meet=MEET).order_by('team', 'last_name', 'first_name')
        return context


class LEDShowViewSet(viewsets.ReadOnlyModelViewSet):
    queryset = models.LEDShow.objects.all()
    serializer_class = serializers.LEDShowSerializer


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


class SessionViewSet(viewsets.ReadOnlyModelViewSet):
    """
    This viewset automatically provides `list` and `detail` actions.
    """
    queryset = models.Session.objects.all()
    serializer_class = serializers.SessionSerializer
