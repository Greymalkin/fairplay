from django.core.management.base import BaseCommand
from competition import models
from registration.models import Gymnast
from django.db.models.signals import post_save


class Command(BaseCommand):
    def handle(self, *args, **kwargs):
        post_save.disconnect(models.update_rankings, sender=models.GymnastEvent, dispatch_uid='update_rankings')

        for gymnast in Gymnast.objects.all():
            gymnast.overall_score = None
            gymnast.rank = None
            gymnast.tie_break = None
            gymnast.save()
            try:
                gymnast.scores.delete()
            except: pass

        for gymnast_event in models.GymnastEvent.objects.all():
            gymnast_event.score = None
            gymnast_event.rank = None
            gymnast_event.save()

        models.TeamAwardRank.objects.all().delete()

        post_save.connect(models.update_rankings, sender=models.GymnastEvent, dispatch_uid='update_rankings')
