# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('gymnastics', '0026_merge'),
    ]

    operations = [
        migrations.AddField(
            model_name='athlete',
            name='overall_score',
            field=models.FloatField(null=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='athlete',
            name='rank',
            field=models.PositiveSmallIntegerField(null=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='athleteevent',
            name='rank',
            field=models.PositiveSmallIntegerField(null=True),
            preserve_default=True,
        ),
    ]
