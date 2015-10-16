# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('competition', '0006_auto_20151015_2212'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='teamaward',
            options={'ordering': ['order'], 'verbose_name_plural': 'Team Awards', 'verbose_name': 'Team Award'},
        ),
        migrations.AddField(
            model_name='teamaward',
            name='order',
            field=models.PositiveSmallIntegerField(default=0),
        ),
    ]
