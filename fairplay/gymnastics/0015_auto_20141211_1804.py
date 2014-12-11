# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('gymnastics', '0014_remove_group_show_difficulty'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='group',
            options={'ordering': ['level']},
        ),
    ]
