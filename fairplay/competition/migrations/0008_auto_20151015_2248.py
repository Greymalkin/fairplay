# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('competition', '0007_auto_20151015_2216'),
    ]

    operations = [
        migrations.AlterField(
            model_name='teamaward',
            name='divisions',
            field=models.ManyToManyField(blank=True, to='competition.Division'),
        ),
    ]
