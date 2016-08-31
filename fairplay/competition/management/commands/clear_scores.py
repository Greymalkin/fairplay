from django.core.management.base import BaseCommand
from competition import models
from django.db.models.signals import post_save


class Command(BaseCommand):
    def handle(self, *args, **kwargs):
        post_save.disconnect(models.update_rankings, sender=models.GymnastEvent, dispatch_uid='update_rankings')

        for athlete in models.Gymnast.objects.all():
            athlete.overall_score = None
            athlete.rank = None
            athlete.tie_break = None
            athlete.save()

        for gymnast_event in models.GymnastEvent.objects.all():
            gymnast_event.score = None
            gymnast_event.rank = None
            gymnast_event.save()

        models.TeamAwardRank.objects.all().delete()

        post_save.connect(models.update_rankings, sender=models.GymnastEvent, dispatch_uid='update_rankings')
