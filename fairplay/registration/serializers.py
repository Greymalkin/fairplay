from rest_framework import serializers
from . import models


class TeamSerializer(serializers.ModelSerializer):
    pass

    class Meta:
        model = models.Team
        fields = ('id', 'team',)


class GymnastSerializer(serializers.ModelSerializer):
    pass

    class Meta:
        model = models.Gymnast
        fields = '__all__'


class UploadUsagCoachSerializer(serializers.ModelSerializer):
    usag_team = serializers.Field(source='team.usag')
    gym = serializers.Field(source='team.gym')
    team = serializers.Field(source='team.team')
    city = serializers.Field(source='team.city')
    state = serializers.Field(source='team.state')

    class Meta:
        model = models.Coach
        fields = '__all__'


class UploadUsagGymnastSerializer(serializers.ModelSerializer):
    usag_team = serializers.Field(source='team.usag')
    gym = serializers.Field(source='team.gym')
    team = serializers.Field(source='team.team')
    city = serializers.Field(source='team.city')
    state = serializers.Field(source='team.state')

    class Meta:
        model = models.Gymnast
        fields = '__all__'
