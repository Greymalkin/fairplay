from rest_framework import serializers
from .models import Group, Event, Athlete, Team, AthleteEvent


class EventSerializer(serializers.ModelSerializer):
    class Meta:
        model = Event
        fields = ('id', 'name',)


class GroupSerializer(serializers.ModelSerializer):
    class Meta:
        model = Group
        fields = ('id', 'level', 'age_group', 'show_difficulty')


class AthleteSerializer(serializers.ModelSerializer):
    group = GroupSerializer()

    class Meta:
        model = Athlete
        fields = ('id', 'last_name', 'first_name', 'group',)


class TeamSerializer(serializers.ModelSerializer):
    athletes = AthleteSerializer(many=True)
    initial_event = EventSerializer()

    class Meta:
        model = Team
        fields = ('id', 'name', 'initial_event', 'athletes')


class AthleteEventSerializer(serializers.ModelSerializer):
    class Meta:
        model = AthleteEvent
        fields = ('id', 'athlete', 'event', 'difficulty_score', 'execution_score')
