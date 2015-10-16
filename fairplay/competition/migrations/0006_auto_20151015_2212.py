# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('competition', '0005_team'),
    ]

    operations = [
        migrations.AlterField(
            model_name='teamaward',
            name='divisions',
            field=models.ManyToManyField(to='competition.Division', null=True, blank=True),
        ),
    ]
