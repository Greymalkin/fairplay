import json
import csv
import operator
import labels
import logging

from datetime import datetime
from django.contrib.humanize.templatetags.humanize import ordinal
from django.conf import settings
from django.http import HttpResponse
from django.views.decorators.csrf import csrf_exempt
from django.views.generic import TemplateView
from reportlab.graphics import shapes
from rest_framework import viewsets

from ledsign.bigdot import BigDotUDP
from meet import models as meetconfig
from registration.models import Team, Coach, Level
from . import models, serializers, ranking


@csrf_exempt
def led_sign(request):
    # print(request.body.decode())
    data = json.loads(request.body.decode())

    if 'device' in data and 'message' in data:
        try:
            sign = BigDotUDP(settings.LED_SIGN_HOST, settings.LED_SIGN_PORT)
            sign.show_message(data['device'], data['message'])
        except Exception:
            response = {'success': False, 'reason': 'could not send to sign'}

    elif 'device' in data:
        try:
            sign = BigDotUDP(settings.LED_SIGN_HOST, settings.LED_SIGN_PORT)
            sign.set_address(data['device'])
        except Exception:
            response = {'success': False, 'reason': 'could not set sign address'}

    else:
        response = {'success': False, 'reason': 'missing data'}

    response = {'success': True}
    return HttpResponse(json.dumps(response), content_type="application/json")


@csrf_exempt
def download_roster(request):
    gymnasts = models.Gymnast.objects.all().order_by('division', 'athlete_id').exclude(is_scratched=True, athlete_id=None)
    events = models.Event.objects.filter(active=True)  # competition.Event

    response = HttpResponse(content_type='text/csv')
    timestamp = datetime.now().strftime('%Y-%m-%d-%H-%M')
    # force download.
    response['Content-Disposition'] = 'attachment;filename=roster_' + timestamp + '.csv'
    # the csv writer
    writer = csv.writer(response)

    header = ['firstname',
              'lastname',
              'gym',
              'levelid',
              'agediv',
              'compno',
              'startevent', ]

    header += [e.initials for e in events]  # competition.Event
    writer.writerow(header)

    for gymnast in gymnasts:
        row = [
            gymnast.first_name,
            gymnast.last_name,
            gymnast.team.team,
            '' if not gymnast.division else gymnast.division.level.level,
            '' if not gymnast.division else gymnast.division.short_name,
            gymnast.athlete_id,
            '' if not gymnast.starting_event else gymnast.starting_event.initials]

        for event in events:  # competition.Event
            try:
                row.append(models.GymnastEvent.objects.get(gymnast=gymnast,
                                                           event=event).score)
            except Exception:
                # GymnastEvent matching query does not exist
                row.append('DNE')
        writer.writerow(row)
    return response


def draw_athlete_label(label, width, height, obj):
    label.add(shapes.String(10, 53, obj['id'], fontName="Helvetica-Bold", fontSize=16))
    label.add(shapes.String(10, 38, obj['name'], fontName="Helvetica", fontSize=12))
    label.add(shapes.String(10, 24, obj['team'], fontName="Helvetica", fontSize=11))
    label.add(shapes.String(10, 10, obj['info'], fontName="Helvetica", fontSize=10))


@csrf_exempt
def download_athlete_labels(request):
    gymnasts = models.Gymnast.objects.all().\
        exclude(is_scratched=True, athlete_id=None).\
        order_by('division__session', 'team', 'division', 'last_name', 'first_name').\
        select_related()

    specs = labels.Specification(
        215.9, 279.4, 3, 10, 66.675, 25.4,
        row_gap=0, corner_radius=2, left_margin=5, right_margin=5)
    sheet = labels.Sheet(specs, draw_athlete_label, border=False)

    athlete_labels = []
    for gymnast in gymnasts:
        session = 'None'
        if gymnast.division and gymnast.division.session.first():
            session = gymnast.division.session.first().name

        label = {}
        label['id'] = str(gymnast.athlete_id)
        label['name'] = '{} {}'.format(gymnast.first_name, gymnast.last_name)
        label['team'] = gymnast.team.team
        label['info'] = '{2} Level: {0} Div: {1}'.format(
            gymnast.level.name.upper(),
            gymnast.division.short_name if gymnast.division else '',
            session)
        athlete_labels.append(label)

    sheet.add_labels(athlete_labels)

    timestamp = datetime.now().strftime('%Y-%m-%d-%H-%M')
    response = HttpResponse(content_type='application/pdf')
    response['Content-Disposition'] = 'attachment;filename=athlete_labels_' + timestamp + '.pdf'
    sheet.save(response)

    return response


def draw_team_label(label, width, height, obj):
    label.add(shapes.String(10, 53, obj['team'], fontName="Helvetica-Bold", fontSize=16))
    label.add(shapes.String(10, 38, obj['session'], fontName="Helvetica", fontSize=12))
    label.add(shapes.String(10, 10, obj['level'], fontName="Helvetica", fontSize=10))


@csrf_exempt
def download_team_labels(request):
    sessions = models.Session.objects.all()

    specs = labels.Specification(
        215.9, 279.4, 3, 10, 66.675, 25.4,
        row_gap=0, corner_radius=2, left_margin=5, right_margin=5)
    sheet = labels.Sheet(specs, draw_team_label, border=False)

    team_labels = []
    for session in sessions:
        levels = ', '.join(map(str, sorted(session.levels)))

        teams = Team.objects.filter(gymnasts__division__session=session).\
            order_by('gymnasts__division__session', 'team').distinct()

        for team in teams:
            team_labels.append({
                'team': team.team,
                'session': session.name,
                'level': 'Level: {}'.format(levels.upper())})

    sheet.add_labels(team_labels)

    timestamp = datetime.now().strftime('%Y-%m-%d-%H-%M')
    response = HttpResponse(content_type='application/pdf')
    response['Content-Disposition'] = 'attachment;filename=team_labels_' + timestamp + '.pdf'
    sheet.save(response)

    return response


def draw_medal_label(label, width, height, obj):
    label.add(shapes.String(width / 2.0, 80, obj['meet'], fontName="Helvetica", fontSize=7, textAnchor="middle"))
    label.add(shapes.String(width / 2.0, 60, obj['place'], fontName="Helvetica-Bold", fontSize=10, textAnchor="middle"))
    label.add(shapes.String(width / 2.0, 48, obj['event'], fontName="Helvetica-Bold", fontSize=10, textAnchor="middle"))
    label.add(shapes.String(width / 2.0, 35, obj['level'], fontName="Helvetica", fontSize=8, textAnchor="middle"))
    label.add(shapes.String(width / 2.0, 25, obj['age_div'], fontName="Helvetica", fontSize=8, textAnchor="middle"))


@csrf_exempt
def download_medal_labels(request):
    specs = labels.Specification(215.9, 279.4, 4, 5, 38.1, 38.1,
        corner_radius=19.0, top_margin=20, bottom_margin=20)
    sheet = labels.Sheet(specs, draw_medal_label, border=False)

    medal_labels = []
    for division in models.Division.objects.all():
        # Event Awards
        for event in models.Event.objects.all():
            for place in range(division.event_award_count):
                medal_labels.append({
                    'meet': division.meet.short_name,
                    'session': division.session.first().name,
                    'level': 'Level: {}'.format(division.level.name.upper()),
                    'age_div': 'Div: {}'.format(division.short_name),
                    'place': '{} Place'.format(ordinal(place + 1)),
                    'event': event.name,
                })
        # All Around Awards, skipping 1st-3rd place
        if division.all_around_award_count > 3:
            for place in range(4, division.all_around_award_count + 1):
                medal_labels.append({
                    'meet': division.meet.short_name,
                    'session': division.session.first().name,
                    'level': 'Level: {}'.format(division.level.name.upper()),
                    'age_div': 'Div: {}'.format(division.short_name),
                    'place': '{} Place'.format(ordinal(place)),
                    'event': 'All Around',
                })

    sheet.add_labels(medal_labels)

    timestamp = datetime.now().strftime('%Y-%m-%d-%H-%M')
    response = HttpResponse(content_type='applicaiton/pdf')
    response['content-Disposition'] = 'attachment;filename=medal_labels_' + timestamp + '.pdf'
    sheet.save(response)
    return response


class SessionCeremonyDivisionView(TemplateView):
    template_name = "session_ceremony_division.html"

    def get_context_data(self, **kwargs):
        context = super(SessionCeremonyDivisionView, self).get_context_data(**kwargs)
        session = models.Session.objects.get(id=self.kwargs['id'])

        # start populating the context
        events = models.Event.objects.filter(active=True)  # competition.Event
        context['session'] = session
        context['divisions'] = []
        context['events'] = events
        context['rankings'] = {}

        for division in session.divisions.all().order_by('level', 'min_age'):
            leaderboards = []

            # division per event leaderboard
            for event in events:  # competition.Event
                event_leaderboard = []
                gymnast_events = models.GymnastEvent.objects.filter(event=event, gymnast__division=division).order_by("rank")
                total_count = len(gymnast_events)
                award_count = division.event_award_count
                if total_count == 2:
                    award_count = 1

                for a in gymnast_events[:award_count]:
                    if a.score is not None and a.score != 0:
                        event_leaderboard.append({
                            'athlete_id': a.gymnast.athlete_id,
                            'abbr_name': '{} {}.'.format(a.gymnast.first_name, a.gymnast.last_name[0]),
                            'full_name': '{} {}'.format(a.gymnast.first_name, a.gymnast.last_name),
                            'team': a.gymnast.team.team,
                            'score': '{:.1f}'.format(a.score),
                            'rank': a.rank
                        })

                leaderboards.append({'event': event.name,
                                     'initials': event.initials,
                                     'level': division.level.name,
                                     'age_division': division.name,
                                     'gymnasts': event_leaderboard})

            # overall leaderboard for division
            aa_leaderboard = []
            gymnasts = models.Gymnast.objects.filter(division=division, is_scratched=False, overall_score__isnull=False).order_by("rank")
            total_count = len(gymnasts)
            award_count = division.all_around_award_count

            # special case of two athletes
            if total_count == 2:
                award_count = 1

            # push out award count on tie at last place
            # TODO

            for a in gymnasts[:award_count]:
                if a.overall_score is not None and a.overall_score != 0:
                    aa_leaderboard.append({
                        'athlete_id': a.athlete_id,
                        'abbr_name': '{} {}.'.format(a.first_name, a.last_name[0]),
                        'full_name': '{} {}'.format(a.first_name, a.last_name),
                        'team': a.team.team,
                        'score': '{:.1f}'.format(a.overall_score),
                        'rank': a.rank
                    })
            leaderboards.append({'event': 'All Around',
                                 'initials': "aa",
                                 'level': division.level.name,
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
        for team_award in models.TeamAward.objects.filter(levels__in=session_levels).distinct():
            ranking.update_team_ranking(team_award)

            tars = models.TeamAwardRank.objects.filter(team_award=team_award).exclude(rank=None).order_by('rank')
            teams = []

            for t in tars[:team_award.award_count]:
                teams.append({'name': t.team.team, 'score': '{:.1f}'.format(t.score), 'rank': t.rank})

            team_awards.append({'id': team_award.id, 'award': team_award.name, 'teams': teams})

        # team leaderboards
        context['teams'] = team_awards
        return context


class SessionCeremonyEventView(TemplateView):
    template_name = "session_ceremony_event.html"

    def get_context_data(self, **kwargs):
        context = super(SessionCeremonyEventView, self).get_context_data(**kwargs)
        session = models.Session.objects.get(id=self.kwargs['id'])

        # start populating the context
        context['session'] = session
        context['events'] = []
        events = models.Event.objects.filter(active=True)  # competition.Event

        for event in events:
            leaderboards = []
            for division in session.divisions.all().order_by('level', 'min_age'):

                event_leaderboard = []
                gymnast_events = models.GymnastEvent.objects.filter(event=event, gymnast__division=division, gymnast__is_scratched=False).order_by("rank")
                total_count = len(gymnast_events)
                award_count = division.event_award_count

                # special case of two athletes
                if total_count == 2:
                    award_count = 1

                # push out award count on tie at last place
                if session.meet.all_last_place_ties_in_awards:
                    while award_count < len(gymnast_events) and gymnast_events[award_count - 1].score == gymnast_events[award_count].score:
                        award_count += 1

                for a in gymnast_events[:award_count]:
                    if a.score is not None and a.score != 0:
                        event_leaderboard.append({
                            'athlete_id': a.gymnast.athlete_id,
                            'abbr_name': '{} {}.'.format(a.gymnast.first_name, a.gymnast.last_name[0]),
                            'full_name': '{} {}'.format(a.gymnast.first_name, a.gymnast.last_name),
                            'team': a.gymnast.team.team,
                            'score': '{:.1f}'.format(a.score),
                            'rank': a.rank,
                            'place': a.place
                        })

                leaderboards.append({'event': event.name,
                                     'initials': event.initials,
                                     'level': division.level.name,
                                     'age_division': division.name,
                                     'gymnasts': event_leaderboard})

            # individual leaderboards
            info = {}
            info['id'] = event.id
            info['name'] = event.name
            info['divisions'] = leaderboards
            context['events'].append(info)

        leaderboards = []
        for division in session.divisions.all().order_by('level', 'min_age'):
            # overall leaderboard for division
            aa_leaderboard = []
            gymnasts = models.Gymnast.objects.filter(division=division, is_scratched=False, overall_score__isnull=False).order_by("rank")
            total_count = len(gymnasts)
            award_count = division.all_around_award_count

            # special case of two athletes
            if total_count == 2:
                award_count = 1

            for a in gymnasts[:award_count]:
                if a.overall_score is not None and a.overall_score != 0:
                    aa_leaderboard.append({
                        'athlete_id': a.athlete_id,
                        'abbr_name': '{} {}.'.format(a.first_name, a.last_name[0]),
                        'full_name': '{} {}'.format(a.first_name, a.last_name),
                        'team': a.team.team,
                        'score': '{:.1f}'.format(a.overall_score),
                        'rank': a.rank,
                        'place': a.place
                    })
            leaderboards.append({'event': 'All Around',
                                 'initials': "aa",
                                 'level': division.level.name,
                                 'age_division': division.name,
                                 'gymnasts': aa_leaderboard})

        info = {}
        info['id'] = 'aa'
        info['name'] = 'All Around'
        info['divisions'] = leaderboards
        context['events'].append(info)

        session_levels = []
        for division in context['session'].divisions.all():
            if division.level not in session_levels:
                session_levels.append(division.level)

        team_awards = []
        for team_award in models.TeamAward.objects.filter(levels__in=session_levels).distinct():
            # !! This calculates the team ranking for this award level.  It takes a hella long time.
            ranking.update_team_ranking(team_award)

            tars = team_award.team_ranks.exclude(rank=None).order_by('rank')
            teams = []

            for t in tars[:team_award.award_count]:
                teams.append({'name': t.team.team, 'score': '{:.1f}'.format(t.score), 'rank': t.rank})

            team_awards.append({'id': team_award.id, 'award': team_award.name, 'teams': teams})

        # team leaderboards
        print(team_awards)
        context['teams'] = team_awards
        return context


class SessionIndividualView(TemplateView):
    template_name = "individual.html"

    def get_context_data(self, **kwargs):
        context = super(SessionIndividualView, self).get_context_data(**kwargs)
        context['meet'] = meetconfig.Meet.objects.get(is_current_meet=True)
        context['session'] = models.Session.objects.get(id=self.kwargs['id'])
        context['events'] = models.Event.objects.filter(active=True)  # competition.Event
        context['divisions'] = []

        for division in context['session'].divisions.all().order_by('level', 'min_age'):
            gymnasts = []
            # should scratched gymnasts be on this report, or hidden?
            for gymnast in division.gymnasts.filter(rank__gt=0, is_scratched=False).order_by('rank'):
                events = []
                # should scratched gymnasts be on this report, or hidden?
                for gymnast_event in models.GymnastEvent.objects.filter(gymnast=gymnast, gymnast__is_scratched=False).order_by('event__order'):
                    score = gymnast_event.score
                    if score is None:
                        score = 0.0
                    events.append({'score': '{:.1f}'.format(score), 'rank': gymnast_event.rank, 'place': gymnast_event.place})

                gymnasts.append({'info': gymnast, 'events': events})
            context['divisions'].append({'info': division.title(), 'gymnasts': gymnasts})
        return context


class SessionTeamView(TemplateView):
    template_name = "team.html"

    def get_context_data(self, **kwargs):
        context = super(SessionTeamView, self).get_context_data(**kwargs)
        context['meet'] = meetconfig.Meet.objects.get(is_current_meet=True)
        context['session'] = models.Session.objects.get(id=self.kwargs['id'])

        session_levels = []
        for division in context['session'].divisions.all():
            if division.level not in session_levels:
                session_levels.append(division.level.group)

        team_awards = []
        events = models.Event.objects.filter(active=True)  # competition.Event
        context['events'] = events
        context['width'] = 200 + 60 * len(events)
        for team_award in models.TeamAward.objects.filter(levels__group__in=session_levels).distinct():

            ranking.update_team_ranking(team_award)

            tars = models.TeamAwardRank.objects.filter(team_award=team_award).order_by('rank')
            teams = []
            dq_teams = []
            # for t in tars[:math.ceil(tars.count() * team_award.award_percentage)]:
            for tar in tars:
                team = {
                    'name': tar.team.team,
                    'score': '{:.1f}'.format(tar.score) if tar.score else None,
                    'rank': tar.rank,
                    'gymnasts': []}

                if tar.rank is not None:
                    gymnasts = models.Gymnast.objects.filter(events__team_event_rankings__team_award_rank=tar).distinct()

                    for gymnast in gymnasts:
                        scores = []
                        for event in events:
                            tarae = models.TeamAwardRankEvent.objects.filter(team_award_rank=tar, event=event, gymnast_event__gymnast=gymnast)

                            if len(tarae) == 1:
                                scores.append(tarae[0].gymnast_event.score)
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
        context['athletes'] = models.Gymnast.objects.filter(division__session=self.kwargs['id']).\
            order_by('team', 'division', 'last_name', 'first_name').\
            select_related()
        return context


class SessionAllTeamsRosterView(SessionScoresheetView):
    template_name = 'roster_allteams.html'


class SessionTeamRosterView(SessionScoresheetView):
    template_name = 'roster_team.html'


class SessionLabelsView(TemplateView):
    template_name = 'label.html'

    def get_context_data(self, **kwargs):
        context = super(SessionLabelsView, self).get_context_data(**kwargs)
        context['session'] = models.Session.objects.get(id=self.kwargs['id'])
        context['athletes'] = models.Gymnast.objects.filter(division__session=self.kwargs['id']).\
            order_by('team', 'division', 'last_name', 'first_name').\
            select_related()
        context['teams'] = Team.objects.filter(gymnasts__division__session=context['session']).\
            order_by('team').\
            distinct()
        return context


class SessionGymnastSignInView(TemplateView):
    template_name = 'gymnast-signin.html'

    def get_context_data(self, **kwargs):
        context = super(SessionGymnastSignInView, self).get_context_data(**kwargs)
        context['session'] = models.Session.objects.get(id=self.kwargs['id'])
        context['gymnasts'] = models.Gymnast.objects.filter(division__session=self.kwargs['id']).\
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
        for event in models.Event.objects.filter(active=True):  # competition.Event
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
        divisions = models.Division.objects.filter(session=session, gymnasts__team=team, gymnasts__starting_event=event, gymnasts__is_scratched=False).distinct()
        return divisions

    def levels_in_rotation(self, session, event, team):
        levels = Level.objects.filter(divisions__session=session, divisions__gymnasts__team=team, divisions__gymnasts__starting_event=event).distinct()
        return levels

    def teams_in_session(self, session):
        teams = Team.objects.filter(gymnasts__division__session=session, gymnasts__is_scratched=False).distinct()
        return teams

    def team_starting_events(self, session, team):
        gymnasts = team.gymnasts.filter(division__session=session, is_scratched=False)
        events = dict((x.starting_event, x) for x in gymnasts).values() # since sqlite3 does not support distinct on
        # events = team.gymnasts.filter(division__session=session, is_scratched=False).distinct('starting_event').order_by()
        return events


class SessionAnnouncerView(TemplateView):
    template_name = 'announce_rotation.html'

    def get_context_data(self, **kwargs):
        context = super(SessionAnnouncerView, self).get_context_data(**kwargs)
        context['session'] = models.Session.objects.get(id=self.kwargs['id'])
        context['events'] = []

        for event in models.Event.objects.filter(active=True):  # competition.Event
            event_info = {}
            event_info['event'] = event
            event_info['rotation'] = []

            for team in self.teams_on_event(context['session'], event):
                team_info = {}
                team_info['team'] = team
                team_info['num_starting_events'] = self.num_team_starting_events(context['session'], team)
                team_info['divisions'] = self.divisions_in_rotation(context['session'], event, team)
                team_info['levels'] = self.levels_in_rotation(context['session'], event, team)
                event_info['rotation'].append(team_info)

            context['events'].append(event_info)
        return context

    def teams_on_event(self, session, event):
        teams = Team.objects.filter(gymnasts__division__session=session, gymnasts__starting_event=event, gymnasts__is_scratched=False).distinct()
        return teams

    def divisions_in_rotation(self, session, event, team):
        divisions = models.Division.objects.filter(session=session, gymnasts__team=team, gymnasts__starting_event=event, gymnasts__is_scratched=False).distinct()
        return divisions

    def levels_in_rotation(self, session, event, team):
        levels = Level.objects.filter(divisions__session=session, divisions__gymnasts__team=team, divisions__gymnasts__starting_event=event).distinct()
        return levels

    def num_team_starting_events(self, session, team):
        qs = models.Gymnast.objects.filter(team=team, division__session=session).values('starting_event').distinct()
        return qs.count()


class CoachHospitalityView(TemplateView):
    template_name = 'coach_hospitality.html'

    def get_context_data(self, **kwargs):
        context = super(CoachHospitalityView, self).get_context_data(**kwargs)
        # context['session'] = models.Session.objects.get(id=self.kwargs['id'])

        levels = Level.objects.all().order_by('order')
        context['all_levels'] = dict((x.level, x) for x in levels).values()

        return context


class CoachSignInView(TemplateView):
    template_name = 'coach-signin.html'

    def get_context_data(self, **kwargs):
        context = super(CoachSignInView, self).get_context_data(**kwargs)
        context['meet'] = meetconfig.Meet.objects.filter(is_current_meet=True)[0]
        context['coaches'] = Coach.objects.all().order_by('team', 'last_name', 'first_name')
        return context


# API Viewsets
class LEDShowViewSet(viewsets.ReadOnlyModelViewSet):
    queryset = models.LEDShow.objects.all()
    serializer_class = serializers.LEDShowSerializer


class EventViewSet(viewsets.ReadOnlyModelViewSet):  # competition.Event
    queryset = models.Event.objects.filter(active=True)
    serializer_class = serializers.EventSerializer


class TeamViewSet(viewsets.ReadOnlyModelViewSet):
    queryset = Team.objects.all()
    serializer_class = serializers.TeamSerializer


class AthleteViewSet(viewsets.ReadOnlyModelViewSet):
    queryset = models.Gymnast.objects.all()
    serializer_class = serializers.GymnastSerializer
    lookup_field = 'athlete_id'


class GymnastEventViewSet(viewsets.ModelViewSet):
    queryset = models.GymnastEvent.objects.all()
    serializer_class = serializers.GymnastEventSerializer


class SessionViewSet(viewsets.ReadOnlyModelViewSet):
    queryset = models.Session.objects.all()
    serializer_class = serializers.SessionSerializer
