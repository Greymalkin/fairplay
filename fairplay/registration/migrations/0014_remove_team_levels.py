# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('registration', '0013_auto_20151016_0322'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='team',
            name='levels',
        ),
    ]
