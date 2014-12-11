# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('gymnastics', '0009_auto_20141210_1411'),
    ]

    operations = [
        migrations.AddField(
            model_name='level',
            name='show_difficulty',
            field=models.BooleanField(default=False),
            preserve_default=True,
        ),
        migrations.AlterField(
            model_name='team',
            name='name',
            field=models.CharField(max_length=255),
            preserve_default=True,
        ),
    ]
