# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('gymnastics', '0014_remove_group_show_difficulty'),
    ]

    operations = [
        migrations.CreateModel(
            name='TeamAwards',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=255)),
                ('groups', models.ManyToManyField(to='gymnastics.Group')),
                ('teams', models.ManyToManyField(to='gymnastics.Team')),
            ],
            options={
                'ordering': ['name'],
            },
            bases=(models.Model,),
        ),
        migrations.AlterModelOptions(
            name='group',
            options={'ordering': ['level']},
        ),
    ]
