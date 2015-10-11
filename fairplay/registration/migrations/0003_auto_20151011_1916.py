# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('competition', '0001_initial'),
        ('registration', '0002_auto_20151011_1859'),
    ]

    operations = [
        migrations.AddField(
            model_name='gymnast',
            name='division',
            field=models.ForeignKey(to='competition.Division', null=True, blank=True, related_name='athletes'),
        ),
        migrations.AddField(
            model_name='gymnast',
            name='starting_event',
            field=models.ForeignKey(to='competition.Event', null=True, blank=True),
        ),
    ]
