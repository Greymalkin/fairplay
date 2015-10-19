# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('registration', '0013_auto_20151016_0322'),
        ('competition', '0008_auto_20151015_2248'),
    ]

    operations = [
        migrations.AddField(
            model_name='teamaward',
            name='levels',
            field=models.ManyToManyField(to='registration.Level'),
        ),
    ]
