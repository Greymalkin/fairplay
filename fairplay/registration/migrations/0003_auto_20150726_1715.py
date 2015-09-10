# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('registration', '0002_auto_20150726_1519'),
    ]

    operations = [
        migrations.AddField(
            model_name='team',
            name='postal_code',
            field=models.CharField(verbose_name='Postal Code', max_length=100, blank=True, null=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='team',
            name='state',
            field=models.CharField(verbose_name='State', max_length=100, blank=True, null=True),
            preserve_default=True,
        ),
        migrations.AlterField(
            model_name='team',
            name='city',
            field=models.CharField(verbose_name='City', max_length=100, blank=True, null=True),
            preserve_default=True,
        ),
    ]
