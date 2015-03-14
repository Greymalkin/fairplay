import csv
import re
from django.core.management.base import BaseCommand
from gymnastics import models
from django.conf import settings


class Command(BaseCommand):
    """
    Go get the data from the a csv file provided by Aerial, and parse it.
    * Create Athletes, Teams, Age Groups
    Example: $ ./manage.py import_athletes fairland.4.csv
    """
    args = "<CSV File>"

    def handle(self, *args, **kwargs):

        # First, clear out athletes, teams, age groups in the db
        models.Athlete.objects.all().delete()
        models.Team.objects.all().delete()
        models.Group.objects.all().delete()

        with open(args[0], 'r') as csvfile:
            unitreader = csv.reader(csvfile)

            header = next(unitreader)

            for row in unitreader:
                print(row)
                # Is there a team / group in the db?  No? Make it.  Retain object.
                team, created = models.Team.objects.get_or_create(
                    name=row[settings.IMPORT_ATHLETES_TEAM_COL])
                # Set default order number for age group based on parsing a number from the file ("6 years", "11 and up")
                group, created = models.Group.objects.get_or_create(
                    level=row[settings.IMPORT_ATHLETES_LEVEL_COL],
                    age_group=row[settings.IMPORT_ATHLETES_AGE_GROUP_COL],
                    order=int(re.findall(r'\d+', row[settings.IMPORT_ATHLETES_AGE_GROUP_COL])[0]))
                # Make the athlete and associate to teams/groups
                athlete = models.Athlete.objects.create(**{
                    'athlete_id': int(row[settings.IMPORT_ATHLETES_ATHLETE_ID_COL]),
                    'last_name': row[settings.IMPORT_ATHLETES_LASTNAME_COL],
                    'first_name': row[settings.IMPORT_ATHLETES_FIRSTNAME_COL],
                    'team': team,
                    'group': group}
                )


        # Update the athlete positions for all the teams
        for t in models.Team.objects.all():
            position = 0
            for gymnast in t.athletes.all():
                gymnast.position = position
                gymnast.save()
                position += 1

        # Reset order for the age groups so they increase ordinally from 0
        counter = 0
        for g in models.Group.objects.all().order_by('level', 'order'):
            g.order = counter
            g.save()
            counter = counter + 1

        print('Import of csv data into cms: Done')
