# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('registration', '0015_auto_20151112_0153'),
    ]

    operations = [
        migrations.AddField(
            model_name='gymnast',
            name='tie_break',
            field=models.FloatField(blank=True, null=True),
        ),
    ]
