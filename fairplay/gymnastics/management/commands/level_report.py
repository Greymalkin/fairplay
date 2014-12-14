import csv
from django.core.management.base import BaseCommand
from gymnastics import models
from django.conf import settings


class Command(BaseCommand):
    """
    Example: $ ./manage.py 4 bwi_level4.csv
    """
    args = "level output"

    def handle(self, *args, **kwargs):
        level = int(args[0])

        with open(args[1], 'w') as csvfile:
            writer = csv.writer(csvfile)

            for team in models.Team.objects.filter(athletes__group__level=level).order_by(athletes__group__id)
