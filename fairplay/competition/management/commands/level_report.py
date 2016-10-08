import csv
import meet
from django.core.management.base import BaseCommand
from competition import models
from django.conf import settings


class Command(BaseCommand):
    """
    Example: $ ./manage.py 4 bwi_level4.csv
    """
    args = "level output"

    def handle(self, *args, **kwargs):
        level = int(args[0])
        current_meet = meet.models.Meet.objects.get(is_current_meet=True)

        with open(args[1], 'w') as csvfile:
            writer = csv.writer(csvfile)
            writer.writerow((current_meet.short_name,))
            writer.writerow(('Level {}'.format(level),))
            writer.writerow(())

            divisions = models.Division.objects.filter(level=level, meet=current_meet)
            events = models.Event.objects.filter(meet=current_meet) #competition.Event
            row = ['','','']
            for event in events:
                row.append(event.initials.upper())
                row.append('R')

            row += ['', 'AA', 'R']
            writer.writerow(row)

            for team in models.Team.objects.filter(meet=current_meet, gymnasts__level=level).order_by('team').distinct('team'):
                writer.writerow((team.team,))
                for agediv in divisions:
                    gymnasts = models.Gymnast.objects.filter(team=team, division=agediv, is_scratched=False)
                    if len(gymnasts) > 0:
                        writer.writerow((agediv.name,))
                        for gymnast in gymnasts:
                            row = [gymnast.athlete_id, gymnast.last_name, gymnast.first_name,]
                            print(row)

                            for event in events:
                                ae = models.GymnastEvent.objects.get(gymnast=gymnast, event=event)
                                row.append(ae.score)
                                row.append(ae.rank)

                            row += ['', gymnast.overall_score, gymnast.rank]

                            writer.writerow(row)

                        writer.writerow(())
