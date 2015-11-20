from django.db import models
from django.dispatch import receiver
from django.db.models.signals import pre_save,post_save, m2m_changed
from django.dispatch import receiver

from meet.models import Meet
from registration.models import Team, Gymnast, Level
from . import ranking


class LEDSign(models.Model):
    sign_id = models.PositiveSmallIntegerField(unique=True)
    device = models.CharField(max_length=255)

    def __str__(self):
        return "{}".format(self.id)

    class Meta:
        verbose_name = "LED sign"
        verbose_name_plural = "LED signs"


class Event(models.Model):
    meet = models.ForeignKey(Meet, related_name='events')
    order = models.PositiveSmallIntegerField()
    name = models.CharField(max_length=255, help_text="Event name")
    initials = models.CharField(max_length=2, help_text="Event initials")
    sign = models.ForeignKey(LEDSign)

    class Meta():
        ordering = ['order', ]

    def __str__(self):
        return self.name

    @property
    def warmup_event(self):
        """ Traditional format warmup event """
        warmup = None
        try:
            warmup = Event.objects.filter(meet=self.meet, order__gt=self.order)[0]
        except:
            warmup = Event.objects.first()
        return warmup


class Division(models.Model):
    meet = models.ForeignKey(Meet, related_name='divisions')
    level = models.ForeignKey(Level)
    name = models.CharField(max_length=50)
    short_name = models.CharField(max_length=10, help_text='For printing in report columns.')
    min_age = models.PositiveSmallIntegerField(default=6)
    max_age = models.PositiveSmallIntegerField(default=18)

    class Meta():
        ordering = ['level', 'min_age', ]

    def __str__(self):
        age = self.min_age
        if self.min_age != self.max_age:
            age = '{}-{}'.format(self.min_age, self.max_age)
        return "Level {} ({} years)".format(self.level, age)

    def title(self):
        return "Level {} ({})".format(self.level, self.name)

    def age_division(self):
        age_division = self.min_age
        if self.min_age != self.max_age:
            age_division = '{}-{}'.format(self.min_age, self.max_age)
        return age_division

    def num_gymnasts(self):
        return self.athletes.all().count()
    num_gymnasts.short_description = "Gymnasts"


class Session(models.Model):
    meet = models.ForeignKey(Meet, related_name='sessions')
    name = models.CharField(max_length=255, help_text="Session name")
    divisions = models.ManyToManyField(Division, related_name='session')

    def __str__(self):
        return self.name

    class Meta():
        ordering = ['name', ]
        verbose_name = "Session"
        verbose_name_plural = "Sessions"

    def num_gymnasts(self):
        try:
            num_gymnasts = [a.athletes.filter(is_scratched=False).count() for a in self.divisions.all()]
            num_gymnasts = (sum(num_gymnasts))
            return num_gymnasts
        except:
            return 0
    num_gymnasts.short_description = "Gymnasts"

    @property
    def levels(self):
        levels = self.divisions.order_by('level_id').distinct('level_id').values_list('level__level', flat=True)
        return levels

    @property
    def division_list(self):
        return self.divisions.values_list('name', flat=True)


class TeamAward(models.Model):
    meet = models.ForeignKey(Meet, related_name='team_awards')
    name = models.CharField(max_length=255)
    award_percentage = models.FloatField(default=0.66)
    divisions = models.ManyToManyField(Division, blank=True)
    levels = models.ManyToManyField(Level)
    order = models.PositiveSmallIntegerField(default=0)

    class Meta:
        verbose_name = "Team Award"
        verbose_name_plural = "Team Awards"
        ordering = ['order']

    def __str__(self):
        return self.name


class TeamAwardRank(models.Model):
    team = models.ForeignKey(Team)
    team_award = models.ForeignKey(TeamAward)
    rank = models.PositiveSmallIntegerField(null=True)
    score = models.FloatField(null=True)


class AthleteEvent(models.Model):
    gymnast = models.ForeignKey(Gymnast, related_name="events")
    event = models.ForeignKey(Event, related_name="gymnasts")
    score = models.FloatField(null=True, blank=True)
    rank = models.PositiveSmallIntegerField(null=True)

    class Meta():
        ordering = ['gymnast', 'event']
        unique_together = ('gymnast', 'event',)

    def __str__(self):
        return "{} - {} - {}".format(
            self.gymnast,
            self.event,
            self.score)


class AthleteManager(models.Manager):
    def get_queryset(self):
        return super(AthleteManager, self).get_queryset().filter(is_scratched=False)


class Athlete(Gymnast):
    objects = AthleteManager()

    class Meta:
        proxy = True
        ordering = ('athlete_id', 'last_name', 'first_name', )

    def __str__(self):
        return "{} {}, {} ({})".format(self.athlete_id, self.last_name, self.first_name, self.team)

    def session(self):
        return ""

    @property
    def as_athlete_firstlast(self):
        return "{0} {1} {2}".format(self.athlete_id, self.first_name, self.last_name)

    @property
    def as_athlete_lastfirst(self):
        return "{0} {2}, {1}".format(self.athlete_id, self.first_name, self.last_name)


class Team(Team):
    pass

    class Meta:
        proxy=True


class Message(models.Model):
    name = models.CharField(max_length=255)
    message = models.TextField()

    def __str__(self):
        return self.name


def populate_athlete(instance, created, raw, **kwargs):
    # Ignore fixtures and saves for existing courses.
    if not created or raw:
        return

    instance.save()

    for event in Event.objects.all():
        ae = AthleteEvent.objects.get_or_create(event=event, gymnast=instance)
        if instance.is_scratched:
            ae.score = 0
            ae.save()


def populate_event(instance, created, raw, **kwargs):
    # Ignore fixtures and saves for existing courses.
    if not created or raw:
        return

    instance.save()

    for athlete in Athlete.objects.all():
        ae = AthleteEvent.objects.get_or_create(event=instance, gymnast=athlete)
        if athlete.is_scratched:
            ae.score = 0
            ae.save()


def scratch_athlete(instance, created, raw, **kwargs):
    if instance.is_scratched:
        ae = instance.events.all().exclude(score__isnull=False)
        ae.update(score=0)


def update_rankings(sender, instance, created, raw, using, update_fields, **kwargs):
    post_save.disconnect(
        None,
        sender=AthleteEvent,
        dispatch_uid='update_rankings')

    if update_fields is None or 'rank' not in update_fields:
        print('{} ranking being updated now'.format(instance.gymnast))
        ranking.update_division_ranking(instance.gymnast.division)
        ranking.update_team_ranking()

    post_save.connect(
        update_rankings,
        sender=AthleteEvent,
        dispatch_uid='update_rankings')

post_save.connect(
    scratch_athlete,
    sender=Athlete,
    dispatch_uid='scratch_athlete')

post_save.connect(
    populate_athlete,
    sender=Athlete,
    dispatch_uid='populate_athlete')

post_save.connect(
    populate_event,
    sender=Event,
    dispatch_uid='populate_event')

post_save.connect(
    update_rankings,
    sender=AthleteEvent,
    dispatch_uid='update_rankings')
