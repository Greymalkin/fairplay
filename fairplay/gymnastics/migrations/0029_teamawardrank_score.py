# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('gymnastics', '0028_teamawardrank'),
    ]

    operations = [
        migrations.AddField(
            model_name='teamawardrank',
            name='score',
            field=models.FloatField(default=1),
            preserve_default=False,
        ),
    ]
