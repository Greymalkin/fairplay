# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('gymnastics', '0036_auto_20150603_0316'),
    ]

    operations = [
        migrations.AlterField(
            model_name='athlete',
            name='athlete_id',
            field=models.PositiveSmallIntegerField(verbose_name='Athlete ID', unique=True),
            preserve_default=True,
        ),
        migrations.AlterField(
            model_name='athlete',
            name='usag_id',
            field=models.CharField(max_length=20, null=True, blank=True, verbose_name='USAG ID', unique=True),
            preserve_default=True,
        ),
    ]
