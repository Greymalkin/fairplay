import csv
from django.core.management.base import BaseCommand
from gymnastics import models
from django.conf import settings


class Command(BaseCommand):
    """
    Go get the data from the a csv file provided by AVC, and parse it.
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
                group, created = models.Group.objects.get_or_create(
                    level=int(row[settings.IMPORT_ATHLETES_LEVEL_COL]),
                    age_group=row[settings.IMPORT_ATHLETES_AGE_GROUP_COL])
                # Make the athlete and associate to teams/groups
                athlete = models.Athlete.objects.create(**{
                    'athlete_id': int(row[settings.IMPORT_ATHLETES_ATHLETE_ID_COL]),
                    'last_name': row[settings.IMPORT_ATHLETES_LASTNAME_COL],
                    'first_name': row[settings.IMPORT_ATHLETES_FIRSTNAME_COL],
                    'team': team,
                    'group': group,
                    'starting_event': models.Event.objects.get(
                        initials__iexact=row[settings.IMPORT_ATHLETES_START_EVENT_COL])}
                )

                for i in range(7, len(row)):
                    if len(row[i]) > 0:
                        event = models.Event.objects.get(initials__iexact=header[i])
                        athlete_event = models.AthleteEvent.objects.get(athlete=athlete, event=event)
                        athlete_event.score = float(row[i])
                        athlete_event.save()

        # Update the athlete positions for all the teams
        for t in models.Team.objects.all():
            position = 0
            for gymnast in t.athletes.all():
                gymnast.position = position
                gymnast.save()
                position += 1

        print('Import of csv data into cms: Done')
