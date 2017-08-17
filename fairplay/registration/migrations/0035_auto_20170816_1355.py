# -*- coding: utf-8 -*-
# Generated by Django 1.9.5 on 2017-08-16 17:55
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('meet', '0013_auto_20170816_1349'),
        ('registration', '0034_gymnast_place'),
    ]

    operations = [
        migrations.CreateModel(
            name='GymnastNotes',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('gymnast', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='gymnast_notes', to='registration.Gymnast')),
                ('meet', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='gymnast_notes', to='meet.Meet')),
            ],
            options={
                'verbose_name': 'Gymnast Note',
                'verbose_name_plural': 'Gymnast Notes',
                'ordering': ['-note__date'],
            },
        ),
        migrations.CreateModel(
            name='Notes',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('author', models.CharField(max_length=50)),
                ('note', models.CharField(max_length=255)),
                ('date', models.DateTimeField(auto_now_add=True)),
                ('meet', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='all_notes', to='meet.Meet')),
            ],
            options={
                'verbose_name': 'Notes',
                'verbose_name_plural': 'Notes',
                'ordering': ['-date'],
            },
        ),
        migrations.CreateModel(
            name='TeamNotes',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('meet', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='team_notes', to='meet.Meet')),
                ('note', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='teams', to='registration.Notes')),
                ('team', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='team_notes', to='registration.Team')),
            ],
            options={
                'verbose_name': 'Team Note',
                'verbose_name_plural': 'Team Notes',
                'ordering': ['-note__date'],
            },
        ),
        migrations.AddField(
            model_name='gymnastnotes',
            name='note',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='gymnasts', to='registration.Notes'),
        ),
    ]
