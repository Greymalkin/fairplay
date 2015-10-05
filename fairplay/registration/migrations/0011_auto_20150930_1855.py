# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('registration', '0010_auto_20150930_1828'),
    ]

    operations = [
        migrations.AlterField(
            model_name='gymnast',
            name='age',
            field=models.PositiveSmallIntegerField(blank=True, null=True, verbose_name='Age', help_text='Competitive Age (as of 9/1)'),
            preserve_default=True,
        ),
    ]
