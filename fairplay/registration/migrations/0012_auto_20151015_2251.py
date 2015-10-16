# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('registration', '0011_team_level_awards'),
    ]

    operations = [
        migrations.RenameField(
            model_name='team',
            old_name='level_awards',
            new_name='team_awards',
        ),
    ]
