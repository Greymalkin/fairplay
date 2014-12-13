# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('gymnastics', '0029_teamawardrank_score'),
    ]

    operations = [
        migrations.AlterField(
            model_name='teamawardrank',
            name='rank',
            field=models.PositiveSmallIntegerField(null=True),
            preserve_default=True,
        ),
        migrations.AlterField(
            model_name='teamawardrank',
            name='score',
            field=models.FloatField(null=True),
            preserve_default=True,
        ),
    ]
