from rest_framework import viewsets
from .models import Event, Team, Athlete, AthleteEvent
from .serializers import (
    EventSerializer,
    TeamSerializer,
    AthleteSerializer,
    AthleteEventSerializer,
)


class EventViewSet(viewsets.ReadOnlyModelViewSet):
    """
    This viewset automatically provides `list` and `detail` actions.
    """
    queryset = Event.objects.all()
    serializer_class = EventSerializer


class TeamViewSet(viewsets.ReadOnlyModelViewSet):
    """
    This viewset automatically provides `list` and `detail` actions.
    """
    queryset = Team.objects.all()
    serializer_class = TeamSerializer


class AthleteViewSet(viewsets.ReadOnlyModelViewSet):
    """
    This viewset automatically provides `list` and `detail` actions.
    """
    queryset = Athlete.objects.all()
    serializer_class = AthleteSerializer


class AthleteEventViewSet(viewsets.ModelViewSet):
    """
    This viewset automatically provides `list` and `detail` actions.
    """
    queryset = AthleteEvent.objects.all()
    serializer_class = AthleteEventSerializer
