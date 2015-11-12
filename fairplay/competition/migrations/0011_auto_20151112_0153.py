# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('competition', '0010_auto_20151105_2324'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='athlete',
            options={'ordering': ('athlete_id', 'last_name', 'first_name')},
        ),
        migrations.AddField(
            model_name='division',
            name='short_name',
            field=models.CharField(default='', max_length=10, help_text='For printing in report columns.'),
            preserve_default=False,
        ),
    ]
