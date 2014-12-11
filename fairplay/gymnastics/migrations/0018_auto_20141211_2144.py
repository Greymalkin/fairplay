# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('gymnastics', '0017_session'),
    ]

    operations = [
        migrations.CreateModel(
            name='SessionEvent',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('position', models.PositiveSmallIntegerField()),
                ('event', models.ForeignKey(to='gymnastics.Event')),
                ('session', models.ForeignKey(related_name='events', to='gymnastics.Session')),
                ('teams', models.ManyToManyField(help_text=b'Teams starting on this event', to='gymnastics.Team')),
            ],
            options={
            },
            bases=(models.Model,),
        ),
        migrations.RemoveField(
            model_name='team',
            name='initial_event',
        ),
    ]
