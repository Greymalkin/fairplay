# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('registration', '0006_auto_20151011_2016'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='shirtsize',
            options={'verbose_name': 'Shirt Size', 'ordering': ['order'], 'verbose_name_plural': 'Shirt Sizes'},
        ),
        migrations.AddField(
            model_name='shirtsize',
            name='order',
            field=models.PositiveSmallIntegerField(default=0),
        ),
    ]
