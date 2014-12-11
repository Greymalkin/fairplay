import csv
from django.core.management.base import BaseCommand
from gymnastics import models
from . import settings as settings

class Command(BaseCommand):
    args = "<CSV File>"

    def handle(self, *args, **kwargs):

        # First, clear out units, media in the db
        models.Athlete.objects.all().delete()
        models.Team.objects.all().delete()
        models.Group.objects.all().delete()

        with open(args[0], 'r') as csvfile:
            unitreader = csv.reader(csvfile)

            # skip csv rows before the data row 
            for i in range(settings.FIRST_ROW):
                next(unitreader)            

            position = 0
            for row in unitreader:
                print(row)
                # print ('team:', row[settings.TEAM_COL])
                # Is there a team in the db?  No? Make it.  Retain Team name.
                team, created = models.Team.objects.get_or_create(
                    name=row[settings.TEAM_COL],
                    initial_event=settings.INITAL_EVENT)    
                group, created = models.Group.objects.get_or_create(
                    level=int(row[settings.LEVEL_COL]), 
                    age_group=row[settings.AGE_GROUP_COL])       
                models.Athlete.objects.create(**{
                    'athlete_id': int(row[settings.ATHLETE_ID_COL]),
                    'last_name': row[settings.LASTNAME_COL],
                    'first_name': row[settings.FIRSTNAME_COL],
                    'team': team,
                    'group': group}
                )      
                position += 1

        # Update the athlete positions for all the teams
        for t in models.Team.objects.all():
            position = 0
            for gymnast in t.athletes.all():
                gymnast.position = position
                gymnast.save()
                position += 1

        print('Import of csv data into cms: Done')
