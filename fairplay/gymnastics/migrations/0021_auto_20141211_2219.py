# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('gymnastics', '0020_auto_20141211_2208'),
    ]

    operations = [
        migrations.AlterField(
            model_name='session',
            name='name',
            field=models.CharField(max_length=255, help_text='Session name'),
            preserve_default=True,
        ),
        migrations.AlterField(
            model_name='team',
            name='qualified',
            field=models.BooleanField(default=True, help_text='Qualifies for team awards'),
            preserve_default=True,
        ),
    ]
