# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('registration', '0008_gymnast_is_scratched'),
    ]

    operations = [
        migrations.AddField(
            model_name='coach',
            name='notes',
            field=models.TextField(blank=True, null=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='gymnast',
            name='notes',
            field=models.TextField(blank=True, null=True),
            preserve_default=True,
        ),
    ]
