# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('gymnastics', '0024_auto_20141212_1604'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='session',
            options={'ordering': ['name']},
        ),
    ]
