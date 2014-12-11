# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('gymnastics', '0004_auto_20141207_1631'),
    ]

    operations = [
        migrations.CreateModel(
            name='AgeGroup',
            fields=[
                ('id', models.AutoField(serialize=False, primary_key=True, verbose_name='ID', auto_created=True)),
                ('name', models.CharField(help_text='Team name', max_length=255)),
            ],
            options={
            },
            bases=(models.Model,),
        ),
        migrations.RemoveField(
            model_name='roster',
            name='event',
        ),
        migrations.RemoveField(
            model_name='roster',
            name='level',
        ),
        migrations.AlterModelOptions(
            name='athlete',
            options={'ordering': ['athlete_id']},
        ),
        migrations.AlterModelOptions(
            name='athleteevent',
            options={'ordering': ['athlete', 'event']},
        ),
        migrations.AlterModelOptions(
            name='event',
            options={'ordering': ['order']},
        ),
        migrations.RemoveField(
            model_name='athlete',
            name='age',
        ),
        migrations.RemoveField(
            model_name='athleteevent',
            name='position',
        ),
        migrations.RemoveField(
            model_name='athleteevent',
            name='roster',
        ),
        migrations.DeleteModel(
            name='Roster',
        ),
        migrations.AddField(
            model_name='athlete',
            name='age_group',
            field=models.ForeignKey(to='gymnastics.AgeGroup', default=1),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='athlete',
            name='initial_event',
            field=models.ForeignKey(to='gymnastics.Event', default=1),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='athlete',
            name='position',
            field=models.PositiveSmallIntegerField(default=1),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='athleteevent',
            name='event',
            field=models.ForeignKey(related_name='athletes', to='gymnastics.Event', default=1),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='event',
            name='order',
            field=models.PositiveSmallIntegerField(default=1),
            preserve_default=False,
        ),
    ]
