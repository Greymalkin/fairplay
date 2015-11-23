# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('competition', '0016_teamawardrankathleteevent'),
    ]

    operations = [
        migrations.AddField(
            model_name='session',
            name='warmup',
            field=models.CharField(choices=[('Traditional', 'Traditional'), ('Warm-up/Compete', 'Warm-up/Compete')], default='Traditional', max_length=25),
        ),
    ]
