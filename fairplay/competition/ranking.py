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

    # TODO: ? setattr(score, '{}_rank'.format(gymnast_event.event.initials), gymnast_event.score)

    # All gymnasts in division (age division), including their event score, overall score, and max score
    division_gymnasts = models.GymnastEvent.objects.filter(gymnast__division=division).annotate(total_score=Sum('gymnast__events__score'))

    for event in models.Event.objects.all():  # competition.Event
        gymnasts = []
        # Sub Select for gymnasts in a single event.
        for a in division_gymnasts.filter(event=event).order_by('-score', '-total_score', '-gymnast__tie_break'):
            gymnast = {
                'athlete_id': a.gymnast.athlete_id,
                'last_name': a.gymnast.last_name,
                'first_name': a.gymnast.first_name,
                'team': a.gymnast.team.team,
                'score': a.score,
                'total_score': a.total_score,
                'tie_break': a.gymnast.tie_break,
                'gymnast_event': a
            }
            gymnasts.append(gymnast)

        rank = 0
        last_score = None
        last_total_score = None
        last_tie_break = None
        # Set ranks, break ties.
        for gymnast in gymnasts:
            # print('gymnast score:', gymnast['score'])

            # skip no score
            if gymnast['score'] is None:
                continue

            if gymnast['score'] == last_score and gymnast['total_score'] == last_total_score and gymnast['tie_break'] == last_tie_break:
                pass
            else:
                rank += 1
            last_score = gymnast['score']
            last_total_score = gymnast['total_score']
            last_tie_break = gymnast['tie_break']
            gymnast['rank'] = rank

            gymnast['gymnast_event'].rank = gymnast['rank']
            gymnast['gymnast_event'].save(update_fields=('rank', ))

        # rank all of the no-shows last
        rank += 1
        for gymnast in gymnasts:
            if gymnast['score'] is None:
                gymnast['gymnast_event'].rank = rank
                gymnast['gymnast_event'].save(update_fields=('rank', ))

    # make a list of all gymnasts in this division
    gymnasts = []
    for a in models.Gymnast.objects.filter(division=division):
        gymnast = {
            'athlete_id': a.athlete_id,
            'last_name': a.last_name,
            'first_name': a.first_name,
            'tie_break': a.tie_break,
            'team': a.team.team,
        }
        info = models.GymnastEvent.objects.filter(gymnast=a).aggregate(total_score=Sum('score'), max_score=Max('score'))
        gymnast['total_score'] = info['total_score']
        gymnast['max_score'] = info['max_score']
        gymnasts.append(gymnast)

    gymnasts = multikeysort(gymnasts, ('total_score', 'max_score'))

    # rank them by total_score, and tie_break
    rank = 0
    last_total_score = None
    last_tie_break = None
    for gymnast in gymnasts:
        if gymnast['total_score'] == last_total_score and gymnast['tie_break'] == last_tie_break:
            pass
        else:
            rank += 1
        last_total_score = gymnast['total_score']
        last_tie_break = gymnast['tie_break']
        gymnast['rank'] = rank
        gymnast['score'] = gymnast['total_score']

        # save rank/score data for overall
        a = models.Gymnast.objects.get(athlete_id=gymnast['athlete_id'])
        a.overall_score = gymnast['score']
        a.rank = gymnast['rank']
        a.save()


def update_team_ranking(team_award):
    from . import models

    teams = []
    meet = team_award.meet

    models.TeamAwardRank.objects.filter(team_award=team_award).delete()

    for t in models.Team.objects.filter(team_awards=team_award):
        team = {'name': t.team, 'score': 0, 'id': t.id}
        tar, created = models.TeamAwardRank.objects.get_or_create(
            team=models.Team.objects.get(id=team['id']),
            team_award=team_award,
            meet=meet)

        models.TeamAwardRankEvent.objects.filter(team_award_rank=tar).delete()

        for event in models.Event.objects.all():  # competition.Event
            divisions = []

            for level in team_award.levels.all():
                for division in level.divisions.all():
                    divisions.append(division)

            top_3 = models.GymnastEvent.objects.filter(
                event=event,
                gymnast__team=t
            ).filter(
                gymnast__division__in=divisions,
                score__isnull=False
            ).order_by("-score")[:3]

            if len(top_3) == 3:
                for index, ae in enumerate(top_3):
                    tarae = models.TeamAwardRankEvent(
                        meet=meet,
                        team_award_rank=tar,
                        event=event,
                        gymnast_event=ae,
                        rank=(index + 1))
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
                meet=meet,
                team=models.Team.objects.get(id=team['id']),
                team_award=team_award)[0]
            # save the team rank
            tar.rank = rank
            tar.score = team['score']
            tar.save()
