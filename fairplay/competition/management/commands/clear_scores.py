from django.core.management.base import BaseCommand
from competition import models
from django.db.models.signals import post_save


class Command(BaseCommand):
    def handle(self, *args, **kwargs):
        post_save.disconnect(models.update_rankings, sender=models.AthleteEvent, dispatch_uid='update_rankings')

        for athlete in models.Athlete.objects.all():
            athlete.overall_score = None
            athlete.rank = None
            athlete.tie_break = None
            athlete.save()

        for athlete_event in models.AthleteEvent.objects.all():
            athlete_event.score = None
            athlete_event.rank = None
            athlete_event.save()

        models.TeamAwardRank.objects.all().delete()

        post_save.connect(models.update_rankings, sender=models.AthleteEvent, dispatch_uid='update_rankings')
