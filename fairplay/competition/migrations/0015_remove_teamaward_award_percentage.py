# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('competition', '0014_merge'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='teamaward',
            name='award_percentage',
        ),
    ]
