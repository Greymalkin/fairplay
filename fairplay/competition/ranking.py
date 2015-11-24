from django.db.models import Sum, Max


def multikeysort(items, columns):
    # Sort the Athletes multiple times by their max score, overall score, and event score
    # This is how you get the ranked Athletes, including all the tie-breaking rules
    result = items

    for col in reversed(columns):
        result = sorted(result, key=lambda x: 0 if x[col] is None else x[col], reverse=True)

    return result


def update_division_ranking(division):
    from . import models

    # All athletes in division (age division), including their event score, overall score, and max score
    division_athletes = models.AthleteEvent.objects.filter(gymnast__division=division).annotate(total_score=Sum('gymnast__events__score'), max_score=Max('gymnast__events__score'))

    for event in models.Event.objects.all():
        athletes = []
        # Sub Select for athletes in a single event.
        for a in division_athletes.filter(event=event).order_by('-score', '-total_score', '-max_score'):
            athlete = {
                'athlete_id': a.gymnast.athlete_id,
                'last_name': a.gymnast.last_name,
                'first_name': a.gymnast.first_name,
                'team': a.gymnast.team.team,
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
            # print('athlete score:', athlete['score'])

            # skip no score
            if athlete['score'] is None:
                continue

            if athlete['score'] == last_score and athlete['total_score'] == last_total_score and athlete['max_score'] == last_max_score:
                pass
            else:
                rank += 1
            last_score = athlete['score']
            last_total_score = athlete['total_score']
            last_max_score = athlete['max_score']
            athlete['rank'] = rank

            athlete['athlete_event'].rank = athlete['rank']
            athlete['athlete_event'].save(update_fields=('rank', ))

        # rank all of the no-shows last
        rank += 1
        for athlete in athletes:
            if athlete['score'] is None:
                athlete['athlete_event'].rank = rank
                athlete['athlete_event'].save(update_fields=('rank', ))

    # make a list of all athletes in this division
    athletes = []
    for a in models.Athlete.objects.filter(division=division):
        athlete = {
            'athlete_id': a.athlete_id,
            'last_name': a.last_name,
            'first_name': a.first_name,
            'team': a.team.team,
        }
        info = models.AthleteEvent.objects.filter(gymnast=a).aggregate(total_score=Sum('score'), max_score=Max('score'))
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
        a = models.Athlete.objects.get(athlete_id=athlete['athlete_id'])
        a.overall_score = athlete['score']
        a.rank = athlete['rank']
        a.save()


def update_team_ranking(team_award):
    from . import models

    teams = []

    models.TeamAwardRank.objects.filter(team_award=team_award).delete()

    for t in models.Team.objects.filter(team_awards=team_award):
        team = {'name': t.team, 'score': 0, 'id': t.id}
        tar, created = models.TeamAwardRank.objects.get_or_create(
            team=models.Team.objects.get(id=team['id']),
            team_award=team_award)

        models.TeamAwardRankAthleteEvent.objects.filter(team_award_rank=tar).delete()

        for event in models.Event.objects.all():
            divisions = []

            for level in team_award.levels.all():
                for division in level.divisions.all():
                    divisions.append(division)

            top_3 = models.AthleteEvent.objects.filter(
                event=event,
                gymnast__team=t
            ).filter(
                gymnast__division__in=divisions,
                score__isnull=False
            ).order_by("-score")[:3]

            if len(top_3) == 3:
                for index, ae in enumerate(top_3):
                    tarae = models.TeamAwardRankAthleteEvent(team_award_rank=tar, event=event, athlete_event=ae, rank=(index + 1))
                    tarae.save()

                score = top_3.aggregate(total=Sum('score'))
                if score['total'] is not None:
                    team['score'] += score['total']

                if team['score'] > 0:
                    teams.append(team)

        teams = multikeysort(teams, ('score',))

        rank = 0
        last_score = None
        for team in teams:
            if team['score'] == last_score:
                pass
            else:
                rank += 1
            last_score = team['score']
            team['rank'] = rank

            tar = models.TeamAwardRank.objects.get_or_create(
                team=models.Team.objects.get(id=team['id']),
                team_award=team_award)[0]
            # save the team rank
            tar.rank = rank
            tar.score = team['score']
            tar.save()
