from rest_framework import serializers
from .models import AgeGroup, Level, Event, Athlete, Team, AthleteEvent


class LevelSerializer(serializers.ModelSerializer):
    class Meta:
        model = Level
        fields = ('id', 'level', 'show_difficulty')


class EventSerializer(serializers.ModelSerializer):
    class Meta:
        model = Event
        fields = ('id', 'name',)


class AgeGroupSerializer(serializers.ModelSerializer):
    class Meta:
        model = AgeGroup
        fields = ('id', 'group', )


class AthleteSerializer(serializers.ModelSerializer):
    level = LevelSerializer()
    age_group = AgeGroupSerializer()

    class Meta:
        model = Athlete
        fields = ('id', 'last_name', 'first_name', 'level', 'age_group',)


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
