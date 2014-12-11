# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('gymnastics', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='athleteevent',
            name='athlete',
            field=models.ForeignKey(to='gymnastics.Athlete', related_name='events'),
            preserve_default=True,
        ),
    ]
