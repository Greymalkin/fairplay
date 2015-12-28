# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('competition', '0025_auto_20151208_1049'),
    ]

    operations = [
        migrations.AlterField(
            model_name='session',
            name='divisions',
            field=models.ManyToManyField(to='competition.Division', blank=True, related_name='session'),
        ),
    ]
