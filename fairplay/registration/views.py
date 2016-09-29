import operator

from datetime import datetime
from django.db.models import Avg, Max, Min, Sum, Count
from django.db.models import Prefetch
from django.conf import settings
from django.views.generic import TemplateView

from rest_framework import viewsets
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
        context['age_range'] = range(4, 19) #TODO: increase max range to 20
        context['total_registered'] = models.Gymnast.objects.filter(is_scratched=False).count()
        context['no_ages'] = models.Gymnast.objects.filter(age=None, is_scratched=False).count()
        gymnast_info = []
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
