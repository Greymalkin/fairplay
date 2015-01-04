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
        meet_settings = models.MeetSettings.objects.get()

        with open(args[1], 'w') as csvfile:
            writer = csv.writer(csvfile)
            writer.writerow((meet_settings.name,))
            writer.writerow(('Level {}'.format(level),))
            writer.writerow(())

            groups = models.Group.objects.filter(level=level)
            events = models.Event.objects.all()
            row = ['','','']
            for event in events:
                row.append(event.initials.upper())
                row.append('R')

            row += ['', 'AA', 'R']
            writer.writerow(row)

            for team in models.Team.objects.filter(athletes__group__level=level).order_by('name').distinct('name'):
                writer.writerow((team.name,))
                for group in groups:
                    athletes = models.Athlete.objects.filter(team=team, group=group, scratched=False)
                    if len(athletes) > 0:
                        writer.writerow((group.age_group,))
                        for athlete in athletes:
                            row = [athlete.athlete_id, athlete.last_name, athlete.first_name,]

                            for event in events:
                                ae = models.AthleteEvent.objects.get(athlete=athlete, event=event)
                                row.append(ae.score)
                                row.append(ae.rank)

                            row += ['', athlete.overall_score, athlete.rank]

                            writer.writerow(row)

                        writer.writerow(())
