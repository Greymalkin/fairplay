# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('registration', '0011_auto_20150930_1855'),
    ]

    operations = [
        migrations.AddField(
            model_name='team',
            name='team',
            field=models.CharField(blank=True, default='', max_length=100, help_text='ex. Fairland'),
            preserve_default=True,
        ),
        migrations.AlterField(
            model_name='team',
            name='gym',
            field=models.CharField(max_length=100, help_text='ex. Fairland Boys Gymnastics'),
            preserve_default=True,
        ),
    ]
