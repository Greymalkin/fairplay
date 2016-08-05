from datetime import datetime

from django.conf import settings
from django.views.generic import TemplateView

from rest_framework import viewsets
from . import models, serializers


class MeetBreakdownView(TemplateView):
    template_name = 'breakdown.html'

    def get_context_data(self, **kwargs):
        context = super(MeetBreakdownView, self).get_context_data(**kwargs)
        context['athletes'] = {}
        athlete_info = []
        # for level in models.Level.objects.all():
        #     level_count = models.Gymnast.objects.filter(level=level, is_scratched=False).count()
        #     athlete_info += "<p style='margin-left:12px;'><strong>Level {} ({} athletes)</strong><ul style='margin-left:20px;margin-bottom:10px'>".format(level, level_count)
        #     for age in range(4, 19):
        #         age_count = Gymnast.objects.filter(level=level, age=age, is_scratched=False).count()
        #         if age_count > 0:
        #             athlete_info += "<li>{}yo ({} athletes)</li>".format(age, age_count)

        #     age_count = Gymnast.objects.filter(level=level, age=None, is_scratched=False).count()
        #     if age_count > 0:
        #         athlete_info += "<li>No age ({} athletes)</li>".format(age_count)
        #     athlete_info += "</ul></p>"
        return context


class OrderingAwardsView(TemplateView):
    template_name = 'ordering_awards.html'

    def get_context_data(self, **kwargs):
        context = super(OrderingAwardsView, self).get_context_data(**kwargs)
        return context

class TeamViewSet(viewsets.ReadOnlyModelViewSet):
    """
    This viewset automatically provides `list` and `detail` actions.
    """
    queryset = models.Team.objects.all()
    serializer_class = serializers.TeamSerializer
