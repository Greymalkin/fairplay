# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('competition', '0011_auto_20151112_0153'),
    ]

    operations = [
        migrations.AlterField(
            model_name='division',
            name='level',
            field=models.ForeignKey(to='registration.Level', related_name='divisions'),
        ),
    ]
