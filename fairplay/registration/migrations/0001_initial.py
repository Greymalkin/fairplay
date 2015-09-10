# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Coach',
            fields=[
                ('id', models.AutoField(verbose_name='ID', primary_key=True, serialize=False, auto_created=True)),
                ('first_name', models.CharField(verbose_name='First Name', max_length=100)),
                ('last_name', models.CharField(verbose_name='Last Name', max_length=100)),
                ('usag', models.CharField(verbose_name='USAG #', null=True, blank=True, max_length=225)),
                ('usag_expire_date', models.DateField(verbose_name='USAG Expires', null=True, blank=True)),
                ('safety_expire_date', models.DateField(verbose_name='Safety Expires', null=True, blank=True)),
                ('background_expire_date', models.DateField(verbose_name='Background Expires', null=True, blank=True)),
            ],
            options={
                'verbose_name': 'Coach',
                'verbose_name_plural': 'Coaches',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='Gymnast',
            fields=[
                ('id', models.AutoField(verbose_name='ID', primary_key=True, serialize=False, auto_created=True)),
                ('first_name', models.CharField(verbose_name='First Name', max_length=100)),
                ('last_name', models.CharField(verbose_name='Last Name', max_length=100)),
                ('usag', models.CharField(verbose_name='USAG #', null=True, blank=True, max_length=225)),
                ('dob', models.DateField(null=True, blank=True)),
                ('age', models.PositiveSmallIntegerField(verbose_name='Age', help_text='Competitive Age')),
                ('is_us_citizen', models.BooleanField(verbose_name='US Citizen?', default=False)),
                ('tshirt', models.CharField(verbose_name='T-Shirt Size', null=True, choices=[('Extra Small (Youth)', 'Extra Small (Youth)'), ('Small (Youth)', 'Small (Youth)'), ('Medium (Youth)', 'Medium (Youth)'), ('Large (Youth)', 'Large (Youth)'), ('Extra Large (Youth)', 'Extra Large (Youth)'), ('Small (Adult)', 'Small (Adult)'), ('Medium (Adult)', 'Medium (Adult)'), ('Large (Adult)', 'Large (Adult)')], blank=True, max_length=20)),
            ],
            options={
                'verbose_name': 'Gymnast',
                'verbose_name_plural': 'Gymnasts',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='Level',
            fields=[
                ('id', models.AutoField(verbose_name='ID', primary_key=True, serialize=False, auto_created=True)),
                ('level', models.CharField(max_length=5)),
                ('order', models.PositiveSmallIntegerField(default=0)),
            ],
            options={
                'verbose_name': 'Level',
                'verbose_name_plural': 'Levels',
                'ordering': ('order',),
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='Team',
            fields=[
                ('id', models.AutoField(verbose_name='ID', primary_key=True, serialize=False, auto_created=True)),
                ('name', models.CharField(max_length=100)),
                ('address_1', models.CharField(verbose_name='Address 1', null=True, blank=True, max_length=100)),
                ('address_2', models.CharField(verbose_name='Address 2', null=True, blank=True, max_length=100)),
                ('city', models.CharField(verbose_name='City', null=True, blank=True, max_length=50)),
                ('first_name', models.CharField(verbose_name='First Name', max_length=100)),
                ('last_name', models.CharField(verbose_name='Last Name', max_length=100)),
                ('email', models.CharField(verbose_name='Email', null=True, blank=True, max_length=225)),
                ('per_gymnast_cost', models.CharField(verbose_name='Per Gymnast $', null=True, choices=[('80', '$80 per gymnast'), ('90', '$90 per gymnast')], blank=True, max_length=5)),
                ('gymnast_cost', models.DecimalField(verbose_name='Gymnast $', default=0, max_digits=6, decimal_places=2)),
                ('level_cost', models.DecimalField(verbose_name='Level $', default=0, max_digits=6, decimal_places=2)),
                ('total_cost', models.DecimalField(verbose_name='Total Registration $', default=0, max_digits=6, decimal_places=2)),
                ('started', models.DateTimeField(verbose_name='Form Started', auto_now_add=True)),
                ('updated', models.DateTimeField(verbose_name='Form Last Updated', auto_now=True)),
                ('payment_postmark', models.DateField(verbose_name='Payment Postmark Date', null=True, blank=True)),
                ('registration_complete', models.DateTimeField(verbose_name='Date Registration Form Completed', null=True, blank=True)),
                ('paid_in_full', models.BooleanField(verbose_name='Paid In Full?', default=False)),
                ('notes', models.TextField(null=True, blank=True)),
                ('levels', models.ManyToManyField(null=True, blank=True, related_name='registrations_set', to='registration.Level')),
            ],
            options={
                'verbose_name': 'Team',
                'verbose_name_plural': 'Teams',
                'ordering': ('name',),
            },
            bases=(models.Model,),
        ),
        migrations.AddField(
            model_name='gymnast',
            name='level',
            field=models.ForeignKey(null=True, to='registration.Level', blank=True),
            preserve_default=True,
        ),
    ]
