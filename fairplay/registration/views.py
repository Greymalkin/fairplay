import operator
import csv
import tempfile
import os

from django.conf import settings
from django.db.models import Count
from django.db.models import Prefetch
from django.views.generic import TemplateView

from rest_framework import viewsets, status
from rest_framework.response import Response
from rest_framework.parsers import FormParser, MultiPartParser
from competition.models import TeamAward
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

        levels = models.Level.objects.all().order_by('group').distinct('group')
        level_groups = sorted(levels, key=operator.attrgetter('order'))

        context['level_groups'] = level_groups
        context['level_divisions'] = level_divisions
        context['age_range'] = range(4, 20)
        context['total_registered'] = models.Gymnast.objects.filter(is_scratched=False).count()
        context['no_ages'] = models.Gymnast.objects.filter(age=None, is_scratched=False).count()
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
    serializer_class = serializers.UploadUsagSerializer
    parser_classes = (FormParser, MultiPartParser,)
    allowed_methods = ('POST', 'PUT')

    def create(self, request):
        print('In API to import usag reservations')
        # pull the uploaded file object from the request
        file_obj = request.data['file'].read()

        # move uploaded zip file into media root, filebrowser
        destination_file_path = os.path.join(settings.MEDIA_ROOT, "{}".format('usag_reservation.csv'))
        print('!!!!!!!!!!! this is where we go', destination_file_path)
        destination = open(destination_file_path, 'wb+')
        destination.write(file_obj)
        destination.close()

        # try:
        #     if not file_obj.name.lower().endswith('.csv'):
        #         return Response({"status": status.HTTP_400_BAD_REQUEST, "message": "Not a csv file."})
        # except Exception:
        #     return Response({"status": status.HTTP_400_BAD_REQUEST, "message": "Not a valid csv file."})

        with open(destination_file_path, 'r') as csvfile:
            reader = csv.reader(csvfile)
            header = ''

            for i, row in enumerate(reader):
                print(i, row)

                if i == 0:
                    header = row
                    next(reader)

        return Response({"status": status.HTTP_201_CREATED, "message": "USAG reservations imported."})
