from django.db.models import Sum, Max


def multikeysort(items, columns):
    # Sort the Athletes multiple times by their max score, overall score, and event score
    # This is how you get the ranked Athletes, including all the tie-breaking rules
    result = items

    for col in reversed(columns):
        result = sorted(result, key=lambda x: 0 if x[col] is None else x[col], reverse=True)

    return result


def update_group_ranking(group):
    from . import models

    # All athletes in group (age division), including their event score, overall score, and max score
    group_athletes = models.AthleteEvent.objects.filter(athlete__group=group).annotate(total_score=Sum('athlete__events__score'), max_score=Max('athlete__events__score'))

    for event in models.Event.objects.all():
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
            print(athlete['score'])

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

    # make a list of all athletes in this group
    athletes = []
    for a in models.Athlete.objects.filter(group=group):
        athlete = {
            'athlete_id': a.athlete_id,
            'last_name': a.last_name,
            'first_name': a.first_name,
            'team': a.team.name,
        }
        info = models.AthleteEvent.objects.filter(athlete=a).aggregate(total_score=Sum('score'), max_score=Max('score'))
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


def update_team_ranking():
    from . import models

    # determine ranking for each team award
    for team_award in models.TeamAward.objects.all():
        teams = []

        for t in models.Team.objects.filter(qualified=True):
            team = {'name': t.name, 'score': 0, 'id': t.id}

            for event in models.Event.objects.all():
                top_3 = models.AthleteEvent.objects.filter(
                    event=event,
                    athlete__team=t
                ).filter(
                    athlete__group__in=team_award.groups.all(),
                    score__isnull=False
                ).order_by("-score")[:3]

                if len(top_3) == 3:
                    print(t.name)
                    print('---')
                    for e in top_3:
                        print(e.athlete.first_name, e.athlete.last_name, e.score)
                    print('Total: ', top_3.aggregate(total=Sum('score')))
                    print('')

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

            # save the team rank
            ta = models.TeamAwardRank.objects.get_or_create(
                team=models.Team.objects.get(id=team['id']),
                team_award=team_award)[0]
            ta.rank = rank
            ta.score = team['score']
            ta.save()
