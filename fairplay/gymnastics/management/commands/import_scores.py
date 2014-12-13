import csv
from django.core.management.base import BaseCommand
from django.conf import settings
from gymnastics import models

class Command(BaseCommand):
    """
    Go get the data from the a csv file provided by AVC, and parse it.
    * Create Athletes, Teams, Age Groups
    Example: $ ./manage.py import_athletes fairland.2013.csv
    """
    args = "<CSV File>"

    def handle(self, *args, **kwargs):

        with open(args[0], 'r') as csvfile:
            unitreader = csv.reader(csvfile)

            # skip csv rows before the data row
            for i in range(settings.IMPORT_SCORES_FIRST_ROW):
                next(unitreader)

            for row in unitreader:
                print(row)

        print('Import of csv data into cms: Done')
