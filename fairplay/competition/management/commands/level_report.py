import csv
from django.core.management.base import BaseCommand
from competition import models
from meet import models as meetconfig
from django.conf import settings


class Command(BaseCommand):
    """
    Example: $ ./manage.py 4 bwi_level4.csv
    """
    args = "level output"

    def handle(self, *args, **kwargs):
        level = int(args[0])
        meet_settings = meetconfig.Meet.objects.get(is_current_meet=True)

        with open(args[1], 'w') as csvfile:
            writer = csv.writer(csvfile)
            writer.writerow((meet_settings.short_name,))
            writer.writerow(('Level {}'.format(level),))
            writer.writerow(())

            divisions = models.Division.objects.filter(level=level, meet=meet_settings)
            events = models.Event.objects.filter(meet=meet_settings)
            row = ['','','']
            for event in events:
                row.append(event.initials.upper())
                row.append('R')

            row += ['', 'AA', 'R']
            writer.writerow(row)

            for team in models.Team.objects.filter(meet=meet_settings, gymnasts__level=level).order_by('team').distinct('team'):
                writer.writerow((team.team,))
                for agediv in divisions:
                    athletes = models.Gymnast.objects.filter(team=team, division=agediv, is_scratched=False)
                    if len(athletes) > 0:
                        writer.writerow((agediv.name,))
                        for athlete in athletes:
                            row = [athlete.athlete_id, athlete.last_name, athlete.first_name,]
                            print(row)

                            for event in events:
                                ae = models.GymnastEvent.objects.get(gymnast=athlete, event=event)
                                row.append(ae.score)
                                row.append(ae.rank)

                            row += ['', athlete.overall_score, athlete.rank]

                            writer.writerow(row)

                        writer.writerow(())
