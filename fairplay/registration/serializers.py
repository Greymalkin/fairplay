from rest_framework import serializers
from . import models


class TeamSerializer(serializers.ModelSerializer):
    pass

    class Meta:
        model = models.Team
        fields = ('id', 'team',)
