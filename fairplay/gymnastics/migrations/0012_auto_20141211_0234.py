# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('gymnastics', '0011_auto_20141211_0226'),
    ]

    operations = [
        migrations.AddField(
            model_name='group',
            name='show_difficulty',
            field=models.BooleanField(help_text='Whether to enter difficulty when scoring', default=False),
            preserve_default=True,
        ),
        migrations.AlterField(
            model_name='group',
            name='level',
            field=models.PositiveSmallIntegerField(default=4),
            preserve_default=False,
        ),
        migrations.DeleteModel(
            name='Level',
        ),
    ]
