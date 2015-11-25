# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('competition', '0023_ledsign_device'),
    ]

    operations = [
        migrations.AlterField(
            model_name='ledshowmessage',
            name='led_show',
            field=models.ForeignKey(to='competition.LEDShow', related_name='messages'),
        ),
    ]
