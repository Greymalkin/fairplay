# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('gymnastics', '0018_auto_20141211_2144'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='sessionevent',
            name='position',
        ),
    ]
