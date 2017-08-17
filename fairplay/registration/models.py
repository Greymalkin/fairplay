import math
from datetime import datetime, date, timedelta

from django.db import models
from django.conf import settings
from django.db.models.signals import post_save, m2m_changed
from django.dispatch import receiver

from meet.models import Meet, MeetManager


class Team(models.Model):
    meet = models.ForeignKey(Meet, related_name='teams')
    gym = models.CharField(max_length=100, help_text="ex. Fairland Boys Gymnastics")
    team = models.CharField(max_length=100, help_text="ex. Fairland")
    address_1 = models.CharField('Address 1', max_length=100, blank=True, null=True)
    address_2 = models.CharField('Address 2', max_length=100, blank=True, null=True)
    city = models.CharField('City', max_length=100, blank=True, null=True)
    state = models.CharField('State', max_length=100, blank=True, null=True)
    postal_code = models.CharField('Postal Code', max_length=100, blank=True, null=True)
    phone = models.CharField('Phone', max_length=100, blank=True, null=True)
    first_name = models.CharField('First Name', max_length=100)
    last_name = models.CharField('Last Name', max_length=100)
    email = models.CharField('Email', max_length=225, blank=True, null=True)
    usag = models.CharField('USAG Club #', max_length=225, blank=True, null=True)
    per_team_award_cost = models.PositiveSmallIntegerField(
        'Team Award Cost',
        null=True, blank=False,
        default=settings.TEAM_AWARD_COST)
    team_awards = models.ManyToManyField(
        'competition.TeamAward',
        blank=True,
        related_name='teams',
        verbose_name="Team Awards Levels")
    started = models.DateTimeField('Form Started', auto_now_add=True)
    updated = models.DateTimeField('Form Last Updated', auto_now=True)
    gymnast_cost = models.DecimalField('Total Gymnast Cost', decimal_places=2, max_digits=6, default=0)
    team_award_cost = models.DecimalField('Total Team Award Cost', decimal_places=2, max_digits=6, default=0)
    total_cost = models.DecimalField('Total Cost', decimal_places=2, max_digits=6, default=0)
    paid_in_full = models.BooleanField('Paid In Full?', default=False)
    notes = models.TextField(blank=True, null=True)
    qualified = models.BooleanField(default=True, help_text="Qualifies for team awards")

    objects = MeetManager()

    class Meta:
        verbose_name = 'Team'
        verbose_name_plural = 'Teams'
        ordering = ('gym',)

    def __str__(self):
        return '{0}'.format(self.gym)

    def contact_name(self):
        return '{} {}'.format(self.first_name, self.last_name)

    def calc_total_cost(self):
        return self.gymnast_cost + self.team_award_cost

    def calc_gymnast_cost(self):
        gymnasts = self.gymnasts.all()
        self.gymnast_cost = 0
        for gymnast in gymnasts:
            if not gymnast.is_scratched:
                self.gymnast_cost += gymnast.per_gymnast_cost
        return self.gymnast_cost

    def calc_team_award_cost(self):
        try:
            num_levels = self.team_awards.count()
            if num_levels > 0:
                self.team_award_cost = self.per_team_award_cost * num_levels
            else:
                self.team_award_cost = 0
            return self.team_award_cost
        except Exception:
            return 0

    def team_rotation_gymnasts(self, session, event):
        qs = self.gymnasts.filter(is_scratched=False, division__session=session, starting_event=event)
        return qs

    # TODO: add a property that figures out if this team qualifies for team awards

    # TODO: add a property that reports if this team is paid in full


class Person(models.Model):
    first_name = models.CharField('First Name', max_length=100)
    last_name = models.CharField('Last Name', max_length=100)
    usag = models.CharField('USAG #', max_length=225, blank=True, null=True)
    is_flagged = models.BooleanField('Flagged!', default=False)
    is_verified = models.BooleanField('Verified', default=False)
    notes = models.TextField(blank=True, null=True)

    class Meta:
        abstract = True
        ordering = ('last_name', 'first_name')

    def __str__(self):
        return "{1}, {0}".format(self.first_name, self.last_name)

    def related_label(self):
        name = '{0}, {1}'.format(self.last_name, self.first_name)
        if self.usag and len(self.usag.strip()):
            name = '{1} ({1})'.format(name, self.usag)
        return name

    @staticmethod
    def autocomplete_search_fields():
        return ("id__iexact", "first_name__icontains", "last_name__icontains")


class Coach(Person):
    meet = models.ForeignKey(Meet, related_name='coaches')
    team = models.ForeignKey(Team, related_name="coaches")
    usag_expire_date = models.DateField('USAG Expires', blank=True, null=True)
    safety_expire_date = models.DateField('Safety Expires', blank=True, null=True)
    background_expire_date = models.DateField('Background Expires', blank=True, null=True)

    objects = MeetManager()

    class Meta:
        verbose_name_plural = 'Coaches'
        verbose_name = 'Coach'


class Gymnast(Person):
    MAG = 'mag'
    WAG = 'wag'
    DISCIPLINE_CHOICES = ((MAG, 'Mens Artistic'), (WAG, 'Womens Artistic'))
    meet = models.ForeignKey(Meet, related_name='gymnasts')
    team = models.ForeignKey(Team, related_name="gymnasts", blank=True, null=True)
    discipline = models.CharField(max_length=20, null=True, choices=DISCIPLINE_CHOICES)
    # TODO can per_gymnast_cost default be a callable?
    per_gymnast_cost = models.PositiveSmallIntegerField(
        'Cost',
        null=True, blank=False,
        default=settings.GYMNAST_COST)
    dob = models.DateField(blank=True, null=True)
    age = models.PositiveSmallIntegerField(
        'Age',
        blank=True, null=True,
        help_text='Competitive Age (as of {}/{})'.format(settings.COMPETITION_MONTH, settings.COMPETITION_DATE))
    is_us_citizen = models.BooleanField('US Citizen?', default=True)
    shirt = models.ForeignKey('ShirtSize', blank=True, null=True, related_name="gymnasts")
    level = models.ForeignKey('Level', blank=True, null=True, related_name="gymnasts")
    is_scratched = models.BooleanField('Scratched?', default=False)
    division = models.ForeignKey(
        'competition.Division',
        related_name='gymnasts',
        blank=True, null=True,
        verbose_name="Age division")
    starting_event = models.ForeignKey(
        'competition.Event',
        null=True, blank=True,
        related_name="starting_gymnasts")
    overall_score = models.FloatField(null=True, blank=True)
    tie_break = models.BigIntegerField(null=True, blank=True)
    rank = models.PositiveSmallIntegerField(null=True, blank=True)
    place = models.PositiveSmallIntegerField(null=True, blank=True)
    athlete_id = models.PositiveSmallIntegerField(
        blank=True, null=True,
        verbose_name='Athlete ID',
        help_text='For use during competition')

    objects = MeetManager()

    class Meta:
        verbose_name_plural = 'Gymnasts'
        verbose_name = 'Gymnast'
        ordering = ('athlete_id', 'last_name', 'first_name', )
        unique_together = ('meet', 'athlete_id')

    def __str__(self):
        flagged = 'FLAGGED! ' if self.is_flagged else ''
        flagged = 'SCRATCHED ' if self.is_scratched else flagged
        usag = self.usag if self.usag and len(self.usag.strip()) else ''
        try:
            level = 'L{}'.format(int(self.level))
        except Exception:
            level = self.level
        return "{3}{1}, {0} ({2}) {4}".format(self.first_name, self.last_name, level, flagged, usag)

    @property
    def competition_age(self):
        if self.dob:
            if self.meet.date.month > 8:
                year = self.meet.date.year + 1
            else:
                year = self.meet.date.year
            cutoff = date(year, settings.COMPETITION_MONTH, settings.COMPETITION_DATE)
            age = (cutoff - self.dob) // timedelta(days=365.2425)
            return age
        else:
            return None

    def event_rotation_gymnasts(session, event):
        qs = Gymnast.objects.filter(is_scratched=False, division__session=session, starting_event=event)
        return qs

    def compute_tie_break(self):
        p = 0
        tie_break = 0
        for gymnast_event in self.events.all().order_by('score'):
            if gymnast_event.score is not None:
                tie_break += int(int(gymnast_event.score * 10) * math.pow(10, p))
            p += 3
        return tie_break


class Level(models.Model):
    meet = models.ForeignKey(Meet, related_name='levels')
    name = models.CharField(max_length=20)
    group = models.CharField(max_length=5)
    level = models.PositiveSmallIntegerField()
    order = models.PositiveSmallIntegerField(default=0)

    objects = MeetManager()

    class Meta:
        verbose_name = 'Level'
        verbose_name_plural = 'Levels'
        ordering = ('order',)

    def __str__(self):
        return self.name

    def num_gymnasts_across_divisions(self):
        num_gymnasts = Gymnast.objects.filter(is_scratched=False, level__group=self.group).count()
        return num_gymnasts

    def division_age_count(self, age):
        age_count = self.gymnasts.filter(is_scratched=False, age=age).count()
        return age_count

    def group_age_count(self, age):
        age_count = Gymnast.objects.filter(is_scratched=False, level__group=self.group, age=age).count()
        return age_count

    def level_coaches(self):
        ''' Report > find how many coaches are with teams with gymnasts registered at a particular level '''
        qs = Team.objects.filter(gymnasts__level__group=self.group).distinct()
        return qs

    def level_coaches_count(self):
        ''' Report > find how many coaches are with teams with gymnasts registered at a particular level
            returns total of all coaches, regardless of team
        '''
        qs = self.level_coaches()
        count = 0
        for coach in qs:
            count += coach.coaches.all().count()
        return count


class ShirtSize(models.Model):
    name = models.CharField(max_length=50)
    order = models.PositiveSmallIntegerField(default=0)

    class Meta:
        verbose_name = 'Shirt Size'
        verbose_name_plural = 'Shirt Sizes'
        ordering = ['order']

    def __str__(self):
        return self.name


class Notes(models.Model):
    author = models.CharField(max_length=50, blank=False, null=False)
    note = models.CharField(max_length=255, blank=False, null=False)
    created = models.DateTimeField(auto_now_add=True)

    objects = MeetManager()

    class Meta:
        ordering = ['-created']
        abstract = True

    def __str__(self):
        return '{} {}'.format(self.author, datetime.strftime(self.created, '%Y-%m-%d'))


class TeamNotes(Notes):
    meet = models.ForeignKey(Meet, related_name='team_notes')
    team = models.ForeignKey(Team, related_name='team_notes')

    class Meta:
        verbose_name = 'Team Note'
        verbose_name_plural = 'Team Notes'


class GymnastNotes(Notes):
    meet = models.ForeignKey(Meet, related_name='gymnast_notes')
    gymnast = models.ForeignKey(Gymnast, related_name='gymnast_notes')

    class Meta:
        verbose_name = 'Gymnast Note'
        verbose_name_plural = 'Gymnast Notes'


# Receivers

@receiver(m2m_changed, sender=Team.team_awards.through)
def level_costs(sender, instance, **kwargs):
    instance.team_award_cost = instance.calc_team_award_cost()
    instance.total_cost = instance.team_award_cost + instance.gymnast_cost
    instance.save()


@receiver(post_save, sender=Gymnast)
def gymnast_costs(sender, instance, **kwargs):
    instance.team.gymnast_cost = instance.team.calc_gymnast_cost()
    instance.team.total_cost = instance.team.team_award_cost + instance.team.gymnast_cost
    instance.team.save()
