# -*- coding: utf-8 -*-
# Generated by Django 1.9.5 on 2016-09-13 02:34
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('competition', '0029_ledsign_meet'),
        ('meet', '0007_auto_20160520_2229'),
        ('registration', '0018_auto_20151228_1215'),
    ]

    operations = [
        migrations.CreateModel(
            name='Registration',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('received', models.DateField()),
                ('gymnast_cost', models.DecimalField(decimal_places=2, default=0, max_digits=6, verbose_name='Total Gymnast Cost')),
                ('level_cost', models.DecimalField(decimal_places=2, default=0, max_digits=6, verbose_name='Level Cost')),
                ('total_cost', models.DecimalField(decimal_places=2, default=0, max_digits=6, verbose_name='Total Registration Cost')),
                ('paid_in_full', models.BooleanField(default=False, verbose_name='Paid In Full?')),
                ('notes', models.TextField(blank=True, null=True)),
                ('meet', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='registrations', to='meet.Meet')),
                ('per_gymnast_cost', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='registration.GymnastPricing')),
                ('per_level_cost', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='registration.LevelPricing')),
                ('team', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='registrations', to='registration.Team')),
                ('team_awards', models.ManyToManyField(blank=True, related_name='registrations', to='competition.TeamAward', verbose_name='Team Awards')),
            ],
            options={
                'verbose_name_plural': 'Registrations',
                'verbose_name': 'Registration',
            },
        ),
        migrations.AddField(
            model_name='gymnast',
            name='jdo',
            field=models.BooleanField(default=False, help_text='Optionals Levels: JDO or Compulsory Levels: Division 2'),
        ),
        migrations.AlterField(
            model_name='gymnast',
            name='team',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, related_name='gymnasts', to='registration.Team'),
        ),
        migrations.AddField(
            model_name='gymnast',
            name='registration',
            field=models.ForeignKey(default=1, on_delete=django.db.models.deletion.CASCADE, related_name='gymnasts', to='registration.Registration'),
            preserve_default=False,
        ),
        migrations.AlterUniqueTogether(
            name='registration',
            unique_together=set([('team', 'received')]),
        ),
    ]
