# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('gymnastics', '0031_group_order'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='group',
            options={'ordering': ['level', 'order']},
        ),
        migrations.AlterField(
            model_name='athlete',
            name='group',
            field=models.ForeignKey(related_name='athletes', to='gymnastics.Group'),
            preserve_default=True,
        ),
    ]
