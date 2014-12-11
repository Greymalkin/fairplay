# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('gymnastics', '0013_auto_20141211_0236'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='group',
            name='show_difficulty',
        ),
    ]
