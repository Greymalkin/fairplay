from rest_framework import serializers
from . import models
from competition.models import Team


class DivisionField(serializers.RelatedField):
    def to_representation(self, value):
        return {'name': value.name, 'level': value.level.level, 'id': value.id}


class LEDSignSerializer(serializers.ModelSerializer):
    class Meta:
        model = models.LEDSign
        fields = ('name', 'device',)


class LEDShowMessageSerializer(serializers.ModelSerializer):
    led_sign = LEDSignSerializer(many=False)

    class Meta:
        model = models.LEDShowMessage
        fields = ('led_sign', 'message')


class LEDShowSerializer(serializers.ModelSerializer):
    messages = LEDShowMessageSerializer(many=True)

    class Meta:
        model = models.LEDShow
        fields = ('name', 'messages')


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


class AthleteEventSerializer(serializers.ModelSerializer):
    class Meta:
        model = models.AthleteEvent
        fields = ('id', 'event', 'score', )


class TeamSerializer(serializers.ModelSerializer):
    pass

    class Meta:
        model = Team
        fields = ('id', 'team',)


class AthleteSerializer(serializers.ModelSerializer):
    division = DivisionField(read_only=True)
    events = AthleteEventSerializer(many=True)
    team = TeamSerializer(read_only=True)

    class Meta:
        model = models.Athlete
        fields = ('id', 'athlete_id', 'last_name', 'first_name', 'division', 'events', 'team', 'starting_event')
        ordering = ('athlete_id', )
