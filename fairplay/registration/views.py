import operator
import csv
import os
import datetime

from django.conf import settings
from django.contrib import messages
from django.db.models import Count
from django.db.models import Prefetch
from django.views.generic import TemplateView

from rest_framework import viewsets, status
from rest_framework.response import Response
from rest_framework.parsers import FormParser, MultiPartParser
from competition.models import TeamAward
from meet.models import Meet
from competition.models import total_meet_medals
from . import models, serializers


class MeetBreakdownView(TemplateView):
    template_name = 'breakdown.html'

    def get_context_data(self, **kwargs):
        context = super(MeetBreakdownView, self).get_context_data(**kwargs)
        level_divisions = models.Level.objects.filter(gymnasts__is_scratched=False).\
            annotate(per_divison_gymnasts=Count('gymnasts'))\
            .prefetch_related(
                Prefetch(
                    "gymnasts",
                    queryset=models.Gymnast.objects.filter(is_scratched=False),
                    to_attr="levdiv_gymnasts"
                )
        )

        levels = models.Level.objects.all().order_by('order')
        level_groups = dict((x.level, x) for x in levels).values()

        # levels = models.Level.objects.all().order_by('group').distinct('group')
        # level_groups = sorted(levels, key=operator.attrgetter('order'))

        context['level_groups'] = level_groups
        context['level_divisions'] = level_divisions
        context['age_range'] = range(4, 20)
        context['total_registered'] = models.Gymnast.objects.filter(is_scratched=False).count()
        context['no_ages'] = models.Gymnast.objects.filter(age=None, is_scratched=False).count()
        context['medals'] = total_meet_medals(details=True)
        context['meet'] = Meet.objects.get(is_current_meet=True)
        return context


class OrderingAwardsView(TemplateView):
    template_name = 'ordering_awards.html'

    def get_context_data(self, **kwargs):
        context = super(OrderingAwardsView, self).get_context_data(**kwargs)
        context['awards'] = TeamAward.objects.all()
        return context


class TeamViewSet(viewsets.ReadOnlyModelViewSet):
    queryset = models.Team.objects.all()
    serializer_class = serializers.TeamSerializer


class ImportUsagReservationViewSet(viewsets.ModelViewSet):
    queryset = models.ImportUsagReservation.objects.all()
    serializer_class = serializers.UploadUsagGymnastSerializer
    parser_classes = (FormParser, MultiPartParser,)
    allowed_methods = ('POST', 'PUT')

    def __init__(self, *args, **kwargs):
        try:
            self.meet = Meet.objects.filter(is_current_meet=True).first()
        except Exception:
            self.meet = None
        return super(ImportUsagReservationViewSet, self).__init__(*args, **kwargs)

    def create(self, request):
        if not request.session.get('meet') or not self.meet:
            messages.add_message(request, messages.WARNING, 'Open the Meet admin and choose the active meet before uploading USAG reservations.')
            return Response(status=status.HTTP_200_OK)

        try:
            # pull the uploaded file object from the request
            file_obj = request.data['file'].read()
            print(request.data['file'].name.lower())

            # test for .csv
            if not request.data['file'].name.lower().endswith('.csv'):
                messages.add_message(request, messages.ERROR, 'Not a USAG reservation file: Not a csv file.')
                return Response({"message": "Not a csv file."}, status=status.HTTP_200_OK)
        except Exception:
            messages.add_message(request, messages.ERROR, 'Not a USAG reservation file: Not a valid csv file.')
            return Response({"message": "Not a valid csv file."}, status=status.HTTP_200_OK)

        # move uploaded file
        destination_file_path = os.path.join(settings.MEDIA_ROOT, "{}".format('usag_reservation.csv'))
        destination = open(destination_file_path, 'wb+')
        destination.write(file_obj)
        destination.close()

        # read csv
        with open(destination_file_path, 'r') as csvfile:
            reader = csv.reader(csvfile)
            header = ''
            parse_type = ''

            for i, row in enumerate(reader):
                # print(i, row)
                # read the header row and determine if this is an athlete or coach export
                if i == 0:
                    header = row
                    print('testing for gymnast: {}'.format(self.test_gymnast(header)))
                    print('testing for coach: {}'.format(self.test_coach(header)))

                    if self.test_gymnast(header):
                        parse_type = 'gymnast'

                    elif self.test_coach(header):
                        parse_type = 'coach'

                    elif self.test_club(header):
                        parse_type = 'club'

                    else:
                        messages.add_message(request, messages.ERROR, 'Not a USAG reservation file')
                        return Response({"message": "Not a USAG reservation file"}, status=status.HTTP_200_OK)

                else:
                    team = self.parse_team(row, parse_type)

                    if parse_type == 'gymnast':
                        self.parse_gymnast(row, team)

                    if parse_type == 'coach':
                        self.parse_coach(row, team)

            messages.add_message(request, messages.SUCCESS, '{} USAG {} reservations imported.'.format(i, parse_type))
            os.remove(destination_file_path)
            return Response({"message": "USAG reservations imported."}, status=status.HTTP_201_CREATED)

    def test_gymnast(self, header):
        if len(header) == 19:
            if header[0].lower() == 'athleteid' and header[18].lower() == 'agegroup':
                models.Gymnast.objects.all().update(is_verified=False)
                return True
        return False

    def test_coach(self, header):
        if len(header) == 10:
            if header[0].lower() == 'memberid' and header[9].lower() == 'clubstate':
                return True
        return False

    def test_club(self, header):
        if len(header) == 18:
            if header[0].lower() == 'clubid' and header[17].lower() == 'coaches':
                return True
        return False

    def parse_level(self, level):
        test = level.split(' ')

        try:
            name = group = level = int(test[1])
        except Exception:
            # USAG only lists JD kids as junior developent... but as of 7/31/17 rules update, they need to be jd d1 or jd d2.
            # For now assume them to be jd d1
            # Expect this to change in the USAG CSV file
            if 'junior development' in level.lower():
                level = 11
                name = 'jd d1'
                group = 'jd'
            else:
                level = 0
                name = group = '?'

        if len(test) == 4 and test[2].lower() == 'division':
            name = '{} d{}'.format(name, test[3])

        level, created = models.Level.objects.get_or_create(
            meet=self.meet, level=level, group=group, name=name)
        return level

    def parse_gymnast(self, row, team):
        # determine discipline, from sex?  col9
        # parse level, add to db if needed  col17

        level = self.parse_level(row[17])

        data = {
            "is_verified": True,
            "first_name": row[1],
            "last_name": row[2],
            "dob": datetime.datetime.strptime(row[15], "%m/%d/%y").date(),
            "age": row[16],
            "level": level,
            "is_us_citizen": True if row[14].lower() == 'yes' else False,
            "discipline": 'mag' if row[9].lower() == 'm' else 'wag',  # won't work for tramp, acro, rhythmic... how do I figure that out in future?
        }
        if level.name.startswith('jd') or level.name == '?':
            data['is_flagged'] = True

        gymnast, created = models.Gymnast.objects.update_or_create(
            meet=self.meet, team=team, usag=row[0], defaults=data)

        if level.name.startswith('jd'):
            gymnast.gymnast_notes.create(
                meet=gymnast.meet, author='import from usag file',
                note='system set level division to D1 on import because USAG file contained ambiguious information.\n\n Ask team\'s coach to confirm gymnast is supposed to be JD D1, or JD D2')
        elif level.name == '?':
            gymnast.gymnast_notes.create(
                meet=gymnast.meet, author='import from usag file',
                note='system cannot determine gymnast\'s level from USAG import.\n\nWhat level is this boy?')

        return gymnast

    def parse_coach(self, row, team):
        data = {
            "first_name": row[1],
            "last_name": row[2],
        }

        coach, created = models.Coach.objects.update_or_create(
            meet=self.meet, team=team, usag=row[0], defaults=data)
        print('   coach', coach)
        return coach

    def parse_team(self, row, parse_type):
        if parse_type == 'coach':
            usag = row[5]
            data = {
                "gym": row[6],
                "team": row[7],
                "city": row[8],
                "state": row[9],
                # "email": row[3],
                # "first_name": row[1],
                # "last_name": row[2],
            }

        if parse_type == 'gymnast':
            usag = row[4]
            data = {
                "gym": row[5],
                "team": row[6],
                "city": row[7],
                "state": row[8],
            }

        if parse_type == 'club':
            usag = row[0]
            name = row[13].split(" ")
            data = {
                "gym": row[1],
                "team": row[2],
                "city": row[3],
                "state": row[4],
                "email": row[15],
                "phone": row[14],
                "first_name": "" if len(name) == 1 else name[0],
                "last_name": row[13].replace(name[0], '').strip()
            }

        team, created = models.Team.objects.update_or_create(
            meet=self.meet, usag=usag, defaults=data)
        return team
