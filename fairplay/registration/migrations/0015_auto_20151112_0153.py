# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('registration', '0014_remove_team_levels'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='gymnast',
            options={'verbose_name': 'Gymnast', 'ordering': ('athlete_id', 'last_name', 'first_name'), 'verbose_name_plural': 'Gymnasts'},
        ),
    ]
