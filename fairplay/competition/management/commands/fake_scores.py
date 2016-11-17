import random
from django.core.management.base import BaseCommand
from competition import models, ranking
from django.db.models.signals import post_save


class Command(BaseCommand):
    def handle(self, *args, **kwargs):
        post_save.disconnect(models.update_rankings, sender=models.GymnastEvent, dispatch_uid='update_rankings')

        for gymnast_event in models.GymnastEvent.objects.all():
            gymnast_event.score = self.random_score()
            gymnast_event.save()

            score, created = models.ScoreRankEvent.objects.get_or_create(meet=gymnast_event.meet, gymnast=gymnast_event.gymnast)
            # set score to column in ScoreRankEvent that matches gymnast_event initials.  If none, this will fail silently.
            setattr(score, gymnast_event.event.initials, gymnast_event.score)
            score.save()

        for gymnast in models.Gymnast.objects.all():
            gymnast.tie_break = gymnast.compute_tie_break()
            gymnast.save()

        for division in models.Division.objects.all():
            ranking.update_division_ranking(division)

        for team_award in models.TeamAward.objects.all():
            ranking.update_team_ranking(team_award)

        post_save.connect(models.update_rankings, sender=models.GymnastEvent, dispatch_uid='update_rankings')

    def random_score(self):
        return random.randint(7, 11) + random.randint(0, 9) / 10.0
