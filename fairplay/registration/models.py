import math
from datetime import datetime, date, timedelta

from django.db import models
from django.conf import settings
from django.db.models.signals import post_save, m2m_changed
from django.dispatch import receiver

from meet.models import Meet, MeetManager


class TeamManager(MeetManager):
    def get_by_natural_key(self, meet, gym, team):
        return self.get(meet__name=meet, gym=gym, team=team)

    def get_queryset(self):
        qs = super(TeamManager, self).get_queryset()
        qs.prefetch_related('team_awards')
        return qs


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
    first_name = models.CharField('First Name', max_length=100, null=True)
    last_name = models.CharField('Last Name', max_length=100, null=True)
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
    notes = models.TextField("Public Notes", blank=True, null=True, help_text="May be exposed in CSV data exports.")
    qualified = models.BooleanField(default=True, help_text="Qualifies for team awards")

    objects = TeamManager()

    class Meta:
        verbose_name = 'Team'
        verbose_name_plural = 'Teams'
        ordering = ('gym',)

    def __str__(self):
        return '{0}'.format(self.gym)

    def natural_key(self):
            return (self.meet.name, self.gym, self.team)

    def contact_name(self):
        return '{} {}'.format(self.first_name, self.last_name)

    def calc_total_cost(self):
        # Note: if team awards costs don't seem to be updating after having changed the price
        # make a change to the team award field in the admin and save
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

    @property
    def calc_amount_paid(self):
        total = 0
        for payment in self.payments.all():
            total += payment.amount
        return total

    @property
    def is_paid_in_full(self):
        return self.calc_total_cost() <= self.calc_amount_paid

    @property
    def is_refund_eligible(self):
        return self.calc_total_cost() >= self.calc_amount_paid

    def team_rotation_gymnasts(self, session, event):
        qs = self.gymnasts.filter(is_scratched=False, division__session=session, starting_event=event)
        return qs

    # TODO: add a property that figures out if this team qualifies for team awards


class Person(models.Model):
    first_name = models.CharField('First Name', max_length=100)
    last_name = models.CharField('Last Name', max_length=100)
    usag = models.CharField('USAG #', max_length=225, blank=True, null=True)
    is_flagged = models.BooleanField('Flagged!', default=False)
    is_verified = models.BooleanField('Verified', default=False)
    notes = models.TextField("Public Notes", blank=True, null=True, help_text="May be exposed in CSV data exports.")

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


class CoachManager(MeetManager):
    def get_by_natural_key(self, meet, team, last_name, first_name):
        return self.get(meet__name=meet, team__gym=team, last_name=last_name, first_name=first_name)


class Coach(Person):
    meet = models.ForeignKey(Meet, related_name='coaches')
    team = models.ForeignKey(Team, related_name="coaches")
    usag_expire_date = models.DateField('USAG Expires', blank=True, null=True)
    safety_expire_date = models.DateField('Safety Expires', blank=True, null=True)
    background_expire_date = models.DateField('Background Expires', blank=True, null=True)

    objects = CoachManager()

    class Meta:
        verbose_name_plural = 'Coaches'
        verbose_name = 'Coach'

    def natural_key(self):
        return (self.meet.name, self.team.gym, self.last_name, self.first_name)


class GymnastManager(MeetManager):
    def get_by_natural_key(self, meet, team, last_name, first_name, discipline, usag):
        return self.get(
            meet__name=meet,
            team__gym=team,
            last_name=last_name,
            first_name=first_name,
            discipline=discipline,
            usag=usag)

    def get_queryset(self):
        qs = super(GymnastManager, self).get_queryset()
        qs.select_related('team', 'shirt', 'level', 'division', 'starting_event')
        return qs


class Gymnast(Person):
    # TODO Foreign Key to registration.Discipline
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
    # TODO: AGE... is differently calculated for mag than for wag.
    age = models.PositiveSmallIntegerField(
        'Age',
        blank=True, null=True,
        help_text='Competitive Age (as of {}/{})'.format(settings.COMPETITION_MONTH, settings.COMPETITION_DATE))
    is_us_citizen = models.BooleanField('US Citizen?', default=True)
    shirt = models.ForeignKey(
        'ShirtSize',
        blank=True, null=True,
        related_name="gymnasts",
        on_delete=models.SET_NULL)
    level = models.ForeignKey(
        'Level',
        blank=True, null=True,
        related_name="gymnasts",
        on_delete=models.SET_NULL)
    is_scratched = models.BooleanField('Scratched?', default=False)
    division = models.ForeignKey(
        'competition.Division',
        related_name='gymnasts',
        blank=True, null=True,
        verbose_name="Age division",
        on_delete=models.SET_NULL)
    starting_event = models.ForeignKey(
        'competition.Event',
        null=True, blank=True,
        related_name="starting_gymnasts",
        on_delete=models.SET_NULL)
    overall_score = models.FloatField(null=True, blank=True)
    tie_break = models.BigIntegerField(null=True, blank=True)
    rank = models.PositiveSmallIntegerField(null=True, blank=True)
    place = models.PositiveSmallIntegerField(null=True, blank=True)
    athlete_id = models.PositiveSmallIntegerField(
        blank=True, null=True,
        verbose_name='Athlete ID',
        help_text='For use during competition')

    objects = GymnastManager()

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

    def natural_key(self):
        return (self.meet.name, self.team.gym, self.last_name, self.first_name, self.discipline, self.usag)

    @property
    def competition_age_mag(self):
        # TODO: AGE... is differently calculated for mag than for wag.
        if self.dob and self.meet.date:
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
        qs = Gymnast.objects.filter(
            is_scratched=False,
            division__session=session,
            starting_event=event).select_related('starting_event', 'division', 'level', 'team')
        return qs

    def compute_tie_break(self):
        p = 0
        tie_break = 0
        for gymnast_event in self.events.all().order_by('score'):
            if gymnast_event.score is not None:
                tie_break += int(int(gymnast_event.score * 10) * math.pow(10, p))
            p += 3
        return tie_break

    @property
    def is_mag(self):
        return self.discipline == 'mag'

    @property
    def is_wag(self):
        return self.discipline == 'wag'


# TODO: might need to add discipline for future flexibility
class LevelManager(MeetManager):
    def get_by_natural_key(self, meet, name):
        return self.get(meet__name=meet, name=name)


# TODO: might need to add discipline for future flexibility
class Level(models.Model):
    meet = models.ForeignKey(Meet, related_name='levels')
    name = models.CharField(max_length=20)
    group = models.CharField(max_length=5)
    level = models.PositiveSmallIntegerField()
    order = models.PositiveSmallIntegerField(default=0)

    objects = LevelManager()

    class Meta:
        verbose_name = 'Level'
        verbose_name_plural = 'Levels'
        ordering = ('order',)

    def __str__(self):
        return self.name

    def natural_key(self):
        return (self.meet.name, self.name)

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


class ShirtSizeManager(models.Manager):
    def get_by_natural_key(self, name):
        return self.get(name=name)


class ShirtSize(models.Model):
    name = models.CharField(max_length=50, unique=True)
    order = models.PositiveSmallIntegerField(default=0)

    objects = ShirtSizeManager()

    class Meta:
        verbose_name = 'Shirt Size'
        verbose_name_plural = 'Shirt Sizes'
        ordering = ['order']

    def __str__(self):
        return self.name

    def natural_key(self):
        return (self.name, )


class Notes(models.Model):
    author = models.CharField(max_length=50, blank=False, null=False)
    note = models.TextField(blank=False, null=False)
    created = models.DateTimeField(auto_now_add=True)

    class Meta:
        ordering = ['-created']
        abstract = True

    def __str__(self):
        return '{} {}'.format(self.author, datetime.strftime(self.created, '%Y-%m-%d'))


class TeamNotesManager(MeetManager):
    def get_by_natural_key(self, meet, team, author, note):
        return self.get(meet__name=meet, team__gym=team, author=author, note=note)


class TeamNotes(Notes):
    meet = models.ForeignKey(Meet, related_name='team_notes')
    team = models.ForeignKey(Team, related_name='team_notes')
    objects = TeamNotesManager()

    class Meta:
        verbose_name = 'Team Note'
        verbose_name_plural = 'Team Notes'

    def natural_key(self):
        return (self.meet.name, self.team.gym, self.author, self.note)


class GymnastNotesManager(MeetManager):
    def get_by_natural_key(self, meet, last_name, first_name, usag, author, note):
        return self.get(
            meet__name=meet,
            gymnast__last_name=last_name,
            gymnast__first_name=first_name,
            gymnast__usag=usag,
            author=author,
            note=note)


class GymnastNotes(Notes):
    meet = models.ForeignKey(Meet, related_name='gymnast_notes')
    gymnast = models.ForeignKey(Gymnast, related_name='gymnast_notes')
    objects = GymnastNotesManager()

    class Meta:
        verbose_name = 'Gymnast Note'
        verbose_name_plural = 'Gymnast Notes'

    def natural_key(self):
        return (
            self.meet.name,
            self.gymnast.last_name,
            self.gymnast.first_name,
            self.gymnast.usag,
            self.author,
            self.note)


class PaymentsManager(MeetManager):
    def get_by_natural_key(self, meet, team, amount, paid, detail):
        return self.get(meet__name=meet, team__gym=team, amount=amount, paid=paid, detail=detail)


class Payments(models.Model):
    meet = models.ForeignKey(Meet, related_name='payments')
    team = models.ForeignKey(Team, related_name="payments")
    amount = models.DecimalField(
        'Amount Paid',
        decimal_places=2, max_digits=6,
        help_text='Enter a negative number for a refund')
    paid = models.DateField("Date", help_text="Date on the check, bank transfer, etc.")
    detail = models.CharField(
        max_length=255,
        help_text="Check #, transfer confirmation #, how was delivered or to whom, etc.",
        blank=True, null=True)
    updated = models.DateTimeField(auto_now=True)

    objects = PaymentsManager()

    class Meta:
        verbose_name = 'Payment'
        verbose_name_plural = 'Payments'
        ordering = ['paid']

    def natural_key(self):
        return (self.meet.name, self.team.gym, self.amount, self.paid, self.detail)


class DisciplineManager(models.Manager):
    def get_by_natural_key(self, name, abbr):
        return self.get(name=name, abbr=abbr)


class Discipline(models.Model):
    name = models.CharField(max_length=100)
    abbr = models.CharField(max_length=10)
    objects = DisciplineManager()

    class Meta:
        ordering = ['name']
        unique_together = (('name', 'abbr'),)

    def __str__(self):
        return self.abbr

    def natural_key(self):
        return (self.name, self.abbr)


# Helper Model, used so we can easily import USAG csv files from the dashboard

class ImportUsagReservation(models.Model):
    file = models.FileField(
        "File",
        max_length=200,
        blank=True, null=True,
        help_text="Upload a USAG reservation")

    class Meta:
        verbose_name_plural = ""
        managed = False


# Signals and Receivers

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
