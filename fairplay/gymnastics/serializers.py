from rest_framework import serializers
from .models import LEDSign, Group, Event, Athlete, Team, AthleteEvent, Message, Session


class LEDSignSerializer(serializers.ModelSerializer):
    class Meta:
        model = LEDSign
        fields = ('sign_id', 'device',)


class EventSerializer(serializers.ModelSerializer):
    sign = LEDSignSerializer()

    class Meta:
        model = Event
        fields = ('id', 'name', 'sign')


class GroupSerializer(serializers.ModelSerializer):
    class Meta:
        model = Group
        fields = ('id', 'level', 'age_group')


class SessionSerializer(serializers.ModelSerializer):
    groups = GroupSerializer(many=True)

    class Meta:
        model = Session
        fields = ('name', 'groups')

class AthleteEventSerializer(serializers.ModelSerializer):
    class Meta:
        model = AthleteEvent
        fields = ('id', 'event', 'difficulty_score', 'execution_score')


class AthleteSerializer(serializers.ModelSerializer):
    group = GroupSerializer()
    events = AthleteEventSerializer(many=True)

    class Meta:
        model = Athlete
        fields = ('id', 'last_name', 'first_name', 'group', 'events')


class TeamSerializer(serializers.ModelSerializer):
    athletes = AthleteSerializer(many=True)
    initial_event = EventSerializer()

    class Meta:
        model = Team
        fields = ('id', 'name', 'initial_event', 'qualified', 'athletes',)


class MessageSerializer(serializers.ModelSerializer):
    class Meta:
        model = Message
        fields = ('id', 'name', 'message')
