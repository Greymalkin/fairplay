from rest_framework import serializers
from . import models
from competition.models import Gymnast, Team


class LEDSignSerializer(serializers.ModelSerializer):
    class Meta:
        model = models.LEDSign
        fields = ('sign_id', 'device',)


class EventSerializer(serializers.ModelSerializer):
    sign = LEDSignSerializer()

    class Meta:
        model = models.Event
        fields = ('id', 'name', 'initials', 'sign')


class DivisionSerializer(serializers.ModelSerializer):
    class Meta:
        model = models.Division


class SessionSerializer(serializers.ModelSerializer):
    divisions = DivisionSerializer(many=True)

    class Meta:
        model = models.Session


class GymnastEventSerializer(serializers.ModelSerializer):
    class Meta:
        model = models.GymnastEvent
        fields = ('id', 'event', 'score', )


class GymnastSerializer(serializers.ModelSerializer):
    division = DivisionSerializer()
    events = GymnastEventSerializer(many=True)

    class Meta:
        model = Gymnast
        fields = ('id', 'athlete_id', 'last_name', 'first_name', 'division', 'events', 'starting_event')


class TeamSerializer(serializers.ModelSerializer):
    athletes = GymnastSerializer(many=True, source='gymnasts')

    class Meta:
        model = Team
        fields = ('id', 'name', 'qualified', 'athletes',)


class MessageSerializer(serializers.ModelSerializer):
    class Meta:
        model = models.Message
        fields = ('id', 'name', 'message')
