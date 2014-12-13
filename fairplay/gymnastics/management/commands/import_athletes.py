import csv
from django.core.management.base import BaseCommand
from django.conf import settings
from gymnastics import models


class Command(BaseCommand):
    """
    Go get the data from the a csv file provided by AVC, and parse it.
    * Create Athletes, Teams, Age Groups
    Example: $ ./manage.py import_athletes fairland.4.csv
    """
    args = "<CSV File>"

    def handle(self, *args, **kwargs):

        # teams need to be set to an initial event.  for importing, we will set them all the same.
        # events are assigned to an initial sign. for importing, we will set them all the same
        INITIAL_SIGN = models.LEDSign.objects.first()
        if not INITIAL_SIGN:
            INITIAL_SIGN, created = models.LEDSign.objects.get_or_create(
                                        sign_id=99, device='alice')

        INITAL_EVENT = models.Event.objects.first()
        if not INITAL_EVENT:
            INITAL_EVENT, created = models.Event.objects.get_or_create(
                                        name='Floor', order=1, sign=INITIAL_SIGN)

        # First, clear out athletes, teams, age groups in the db
        models.Athlete.objects.all().delete()
        models.Team.objects.all().delete()
        models.Group.objects.all().delete()

        with open(args[0], 'r') as csvfile:
            unitreader = csv.reader(csvfile)

            # skip csv rows before the data row
            for i in range(settings.IMPORT_ATHLETES_FIRST_ROW):
                next(unitreader)

            for row in unitreader:
                print(row)
                # Is there a team / group in the db?  No? Make it.  Retain object.
                team, created = models.Team.objects.get_or_create(
                    name=row[settings.IMPORT_ATHLETES_TEAM_COL])
                group, created = models.Group.objects.get_or_create(
                    level=int(row[settings.IMPORT_ATHLETES_LEVEL_COL]),
                    age_group=row[settings.IMPORT_ATHLETES_AGE_GROUP_COL])
                # Make the athlete and associate to teams/groups
                models.Athlete.objects.create(**{
                    'athlete_id': int(row[settings.IMPORT_ATHLETES_ATHLETE_ID_COL]),
                    'last_name': row[settings.IMPORT_ATHLETES_LASTNAME_COL],
                    'first_name': row[settings.IMPORT_ATHLETES_FIRSTNAME_COL],
                    'team': team,
                    'group': group,
                    'starting_event': settings.IMPORT_ATHLETES_INITAL_EVENT}
                )

        # Update the athlete positions for all the teams
        for t in models.Team.objects.all():
            position = 0
            for gymnast in t.athletes.all():
                gymnast.position = position
                gymnast.save()
                position += 1

        print('Import of csv data into cms: Done')
