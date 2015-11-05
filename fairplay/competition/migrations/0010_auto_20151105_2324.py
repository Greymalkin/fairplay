# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('competition', '0009_teamaward_levels'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='session',
            options={'verbose_name_plural': 'Sessions', 'ordering': ['name'], 'verbose_name': 'Session'},
        ),
        migrations.AlterField(
            model_name='athleteevent',
            name='gymnast',
            field=models.ForeignKey(related_name='events', to='registration.Gymnast'),
        ),
    ]
