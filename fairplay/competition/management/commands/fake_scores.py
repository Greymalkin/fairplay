import random
from django.core.management.base import BaseCommand
from competition import models, ranking
from django.db.models.signals import post_save


class Command(BaseCommand):
    def handle(self, *args, **kwargs):
        post_save.disconnect(models.update_rankings, sender=models.AthleteEvent, dispatch_uid='update_rankings')

        for athlete_event in models.AthleteEvent.objects.all():
            athlete_event.score = self.random_score()
            athlete_event.save()

        for division in models.Division.objects.all():
            ranking.update_division_ranking(division)

        for team_award in models.TeamAward.objects.all():
            ranking.update_team_ranking(team_award)

        post_save.connect(models.update_rankings, sender=models.AthleteEvent, dispatch_uid='update_rankings')

    def random_score(self):
        return random.randint(7, 11) + random.randint(0, 9)/10.0
