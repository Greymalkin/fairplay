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


# Sort the Athletes multiple times by their max score, overall score, and event score
# This is how you get the ranked Athletes, including all the tie-breaking rules
def multikeysort(items, columns):
    result = items

    for col in reversed(columns):
        result = sorted(result, key=lambda x: 0 if x[col] is None else x[col], reverse=True)

    return result


def calculate_session_ranking(session):

        for group in session.groups.all():

            # All athletes in group (age division), including their event score, overall score, and max score
            group_athletes = AthleteEvent.objects.filter(athlete__group=group).annotate(total_score=Sum('athlete__events__score'), max_score=Max('athlete__events__score'))

            for event in Event.objects.all():
                athletes = []
                # Sub Select for athletes in a single event. 
                for a in group_athletes.filter(event=event).order_by('-score', '-total_score', '-max_score'):
                    athlete = {
                        'athlete_id': a.athlete.athlete_id,
                        'last_name': a.athlete.last_name,
                        'first_name': a.athlete.first_name,
                        'team': a.athlete.team.name,
                        'score': a.score,
                        'total_score': a.total_score,
                        'max_score': a.max_score,
                        'athlete_event': a
                    }
                    athletes.append(athlete)

                rank = 0
                last_score = None
                last_total_score = None
                last_max_score = None
                # Set ranks, break ties.
                for athlete in athletes:
                    if athlete['score'] is not None:
                        if athlete['score'] == last_score and athlete['total_score'] == last_total_score and athlete['max_score'] == last_max_score:
                            pass
                        else:
                            rank += 1
                        last_score = athlete['score']
                        last_total_score = athlete['total_score']
                        last_max_score = athlete['max_score']
                        athlete['rank'] = rank

                        athlete['athlete_event'].rank = athlete['rank']
                        athlete['athlete_event'].save()

                # rank all of the no-shows last
                rank += 1
                for athlete in athletes:
                    if athlete['score'] is None:
                        athlete['athlete_event'].rank = rank
                        athlete['athlete_event'].save()


            # make a list of all athletes in this group
            athletes = []
            for a in Athlete.objects.filter(group=group, scratched=False):
                athlete = {
                    'athlete_id': a.athlete_id,
                    'last_name': a.last_name,
                    'first_name': a.first_name,
                    'team': a.team.name,
                }
                info = AthleteEvent.objects.filter(athlete=a).aggregate(total_score=Sum('score'), max_score=Max('score'))
                athlete['total_score'] = info['total_score']
                athlete['max_score'] = info['max_score']
                athletes.append(athlete)

            athletes = multikeysort(athletes, ('total_score', 'max_score'))

            # rank them by total_score, and max_score
            rank = 0
            last_total_score = None
            last_max_score = None
            for athlete in athletes:
                if athlete['total_score'] == last_total_score and athlete['max_score'] == last_max_score:
                    pass
                else:
                    rank += 1
                last_total_score = athlete['total_score']
                last_max_score = athlete['max_score']
                athlete['rank'] = rank
                athlete['score'] = athlete['total_score']

                # save rank/score data for overall
                a = Athlete.objects.get(athlete_id=athlete['athlete_id'])
                a.overall_score = athlete['score']
                a.rank = athlete['rank']
                a.save()

        # determine ranking for each team award
        for team_award in TeamAward.objects.all():
            teams = []
            for t in Team.objects.filter(qualified=True):
                team = {'name': t.name, 'score': 0, 'id': t.id}
                for event in Event.objects.all():
                    top_3 = AthleteEvent.objects.filter(
                        event=event,
                        athlete__team=t
                    ).filter(
                        athlete__group__in=team_award.groups.all()
                    ).order_by("-score")[:3]
                    if len(top_3) == 3:
                        score = top_3.aggregate(total=Sum('score'))
                        if score['total'] is not None:
                            team['score'] += score['total']

                        if team['score'] > 0:
                            teams.append(team)

            teams = multikeysort(teams, ('score',))
            teams.reverse()

            rank = 0
            last_score = None
            for team in teams:
                if team['score'] == last_score:
                    pass
                else:
                    rank += 1
                last_score = team['score']
                team['rank'] = rank

                # save the team rank
                ta = TeamAwardRank.objects.get_or_create(team=Team.objects.get(id=team['id']), team_award=team_award)[0]
                ta.rank = rank
                ta.score = team['score']
                ta.save()


class SessionCeremonyView(TemplateView):
    template_name = "session_ceremony.html"

    def get_context_data(self, **kwargs):
        context = super(SessionCeremonyView, self).get_context_data(**kwargs)
        session = Session.objects.get(id=self.kwargs['id'])
        meet_settings = MeetSettings.objects.get()

        # go do the actual math
        calculate_session_ranking(session)

        # start populating the context
        context['session'] = session
        context['groups'] = []
        context['events'] = Event.objects.all()
        context['rankings'] = {}

        for group in session.groups.all():
            leaderboards = []

            # group per event leaderboard
            for event in Event.objects.all():
                leaderboard = []
                athlete_events = AthleteEvent.objects.filter(event=event, athlete__group=group, athlete__scratched=False).order_by("rank")
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

    # def get_context_data_old(self, **kwargs):
    #     context = super(SessionLeaderboardView, self).get_context_data(**kwargs)

    #     session = Session.objects.get(id=self.kwargs['id'])
    #     leaderboards = []

    #     for group in session.groups.all():

    #         for event in Event.objects.all():
    #             athletes = []
    #             for a in AthleteEvent.objects.filter(event=event, athlete__group=group):
    #                 athlete = {
    #                     'athlete_id': a.athlete.athlete_id,
    #                     'last_name': a.athlete.last_name,
    #                     'first_name': a.athlete.first_name,
    #                     'team': a.athlete.team.name,
    #                     'score': a.score,
    #                 }
    #                 info = AthleteEvent.objects.filter(athlete=a.athlete).aggregate(total_score=Sum('score'), max_score=Max('score'))
    #                 athlete['total_score'] = info['total_score']
    #                 athlete['max_score'] = info['max_score']
    #                 athletes.append(athlete)

    #             athletes = multikeysort(athletes, ('score', 'total_score', 'max_score'))
    #             athletes.reverse()
    #             rank = 0
    #             last_score = None
    #             last_total_score = None
    #             last_max_score = None
    #             for athlete in athletes:
    #                 if athlete['score'] == last_score and athlete['total_score'] == last_total_score and athlete['max_score'] == last_max_score:
    #                     pass
    #                 else:
    #                     rank += 1
    #                 last_score = athlete['score']
    #                 last_total_score = athlete['total_score']
    #                 last_max_score = athlete['max_score']
    #                 athlete['rank'] = rank

    #             leaderboards.append({'event': event.name,
    #                                  'initials': event.initials,
    #                                  'level': group.level,
    #                                  'age_group': group.age_group,
    #                                  'athletes': athletes})

    #         athletes = []
    #         for a in Athlete.objects.filter(group=group):
    #             athlete = {
    #                 'athlete_id': a.athlete_id,
    #                 'last_name': a.last_name,
    #                 'first_name': a.first_name,
    #                 'team': a.team.name,
    #             }
    #             info = AthleteEvent.objects.filter(athlete=a).aggregate(total_score=Sum('score'), max_score=Max('score'))
    #             athlete['total_score'] = info['total_score']
    #             athlete['max_score'] = info['max_score']
    #             athletes.append(athlete)

    #         athletes = multikeysort(athletes, ('total_score', 'max_score'))
    #         athletes.reverse()

    #         rank = 0
    #         last_total_score = None
    #         last_max_score = None
    #         for athlete in athletes:
    #             if athlete['total_score'] == last_total_score and athlete['max_score'] == last_max_score:
    #                 pass
    #             else:
    #                 rank += 1
    #             last_total_score = athlete['total_score']
    #             last_max_score = athlete['max_score']
    #             athlete['rank'] = rank
    #             athlete['score'] = athlete['total_score']

    #         leaderboards.append({'event': 'Overall',
    #                              'initials': "overall",
    #                              'level': group.level,
    #                              'age_group': group.age_group,
    #                              'athletes': athletes})

    #     context['groups'] = session.groups.all()
    #     context['events'] = Event.objects.all()
    #     context['individual'] = leaderboards

    #     team_awards = []
    #     for team_award in TeamAward.objects.all():
    #         teams = []
    #         for t in Team.objects.all():
    #             team = {'name': t.name, 'score': 0}
    #             for event in Event.objects.all():
    #                 top_3 = AthleteEvent.objects.filter(event=event, athlete__team=t).filter(athlete__group__in=team_award.groups.all()).order_by("-score")[:3].aggregate(total=Sum('score'))
    #                 if top_3['total'] is not None:
    #                     team['score'] += top_3['total']

    #             if team['score'] > 0:
    #                 teams.append(team)
    #         teams = multikeysort(teams, ('score',))
    #         teams.reverse()

    #         rank = 0
    #         last_score = None
    #         for team in teams:
    #             if team['score'] == last_score:
    #                 pass
    #             else:
    #                 rank += 1
    #             last_score = team['score']
    #             team['rank'] = rank

    #         team_awards.append({'award': team_award.name, 'teams': teams})

    #     context['teams'] = team_awards

    #     return context


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
