from rest_framework import serializers
from . import models


class MeetSerializer(serializers.ModelSerializer):
    pass

    class Meta:
        model = models.Meet
