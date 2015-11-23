# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('competition', '0019_merge'),
    ]

    operations = [
        migrations.AlterField(
            model_name='division',
            name='all_around_award_count',
            field=models.PositiveSmallIntegerField(default=3, verbose_name='All-around award count'),
        ),
    ]
