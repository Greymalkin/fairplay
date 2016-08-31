import math
from colorama import Fore
from django.db import models
from django.db.models.signals import post_save

from meet.models import Meet, MeetManager
from registration.models import Team, Gymnast, Level
from . import ranking


class LEDSign(models.Model):
    name = models.CharField(max_length=255)
    device = models.PositiveSmallIntegerField()

    def __str__(self):
        return self.name

    class Meta:
        verbose_name = "LED sign"
        verbose_name_plural = "LED signs"


class Event(models.Model):
    meet = models.ForeignKey(Meet, related_name='events')
    order = models.PositiveSmallIntegerField()
    name = models.CharField(max_length=255, help_text="Event name")
    initials = models.CharField(max_length=2, help_text="Event initials")
    sign = models.ForeignKey(LEDSign, blank=True, null=True)

    objects = MeetManager()

    class Meta():
        ordering = ['order', ]

    def __str__(self):
        return self.name

    @property
    def warmup_event_starthere(self):
        """ Traditional Format. If this is where you start your warmup, where will your first event rotation start? """
        warmup = None
        try:
            warmup = Event.objects.filter(meet=self.meet, order__gt=self.order)[0]
        except:
            warmup = Event.objects.filter(meet=self.meet).order_by('order')[0]
        return warmup

    @property
    def warmup_event_endhere(self):
        """ Traditional Format. Where do you start your warmup if you need to end warmup at THIS, first event rotation? """
        warmup = None
        try:
            warmup = Event.objects.filter(meet=self.meet, order__lt=self.order).order_by('-order')[0]
        except:
            warmup = Event.objects.filter(meet=self.meet).order_by('-order')[0]
        return warmup


class Division(models.Model):
    meet = models.ForeignKey(Meet, related_name='divisions')
    level = models.ForeignKey(Level, related_name='divisions')
    name = models.CharField(max_length=50)
    short_name = models.CharField(max_length=10, help_text='For printing in report columns.')
    min_age = models.PositiveSmallIntegerField(default=6)
    max_age = models.PositiveSmallIntegerField(default=18)
    event_award_count = models.PositiveSmallIntegerField(default=3, help_text="Number of places individual awards will go out to")
    all_around_award_count = models.PositiveSmallIntegerField(verbose_name="All-around award count", default=3, help_text="Number of places all around awards will go out to")

    objects = MeetManager()

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
    divisions = models.ManyToManyField(Division, related_name='session', blank=True)
    TRADITIONAL = 'Traditional'
    COMPETE = 'Warm-up/Compete'
    WARMUP = ((TRADITIONAL, TRADITIONAL), (COMPETE, COMPETE))
    warmup = models.CharField(max_length=25, choices=WARMUP, default=TRADITIONAL)

    objects = MeetManager()

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
    levels = models.ManyToManyField(Level)
    award_count = models.PositiveSmallIntegerField(default=3, help_text='Number of places team awards will go out to')
    order = models.PositiveSmallIntegerField(default=0)

    objects = MeetManager()

    class Meta:
        verbose_name = "Team Award"
        verbose_name_plural = "Team Awards"
        ordering = ['order']

    def __str__(self):
        return self.name


class TeamAwardRank(models.Model):
    meet = models.ForeignKey(Meet, related_name='team_ranks')
    team = models.ForeignKey(Team)
    team_award = models.ForeignKey(TeamAward)
    rank = models.PositiveSmallIntegerField(null=True)
    score = models.FloatField(null=True)

    objects = MeetManager()

    def __str__(self):
        return "{} - {}".format(self.team_award, self.team)

    class Meta:
        verbose_name = 'Team Award Rank'
        verbose_name_plural = 'Team Award Ranks'


class TeamAwardRankEvent(models.Model):
    meet = models.ForeignKey(Meet, related_name='team_event_rankings')
    team_award_rank = models.ForeignKey(TeamAwardRank, related_name='team_event_rankings')
    event = models.ForeignKey('Event', related_name='team_event_rankings')
    gymnast_event = models.ForeignKey('GymnastEvent', related_name='team_event_rankings')
    rank = models.PositiveSmallIntegerField(null=True)

    objects = MeetManager()

    def __str__(self):
        return "{} - {} - {} - {} ({})".format(self.team_award_rank.team_award, self.team_award_rank.team, self.event, self.gymnast_event.gymnast, self.rank)

    class Meta:
        verbose_name = 'Team Award Rank Athlete Event'
        verbose_name_plural = 'Team Award Rank Athlete Events'


class GymnastEvent(models.Model):
    meet = models.ForeignKey(Meet, related_name='gymnast_events')
    gymnast = models.ForeignKey(Gymnast, related_name="events")
    event = models.ForeignKey(Event, related_name="gymnasts")
    score = models.FloatField(null=True, blank=True)
    rank = models.PositiveSmallIntegerField(null=True)

    objects = MeetManager()

    class Meta():
        ordering = ['gymnast', 'event']
        unique_together = ('gymnast', 'event',)

    def __str__(self):
        return "{} - {} - {}".format(
            self.gymnast,
            self.event,
            self.score)


class CompetitionGymnastManager(MeetManager):
    # def get_queryset(self):
    #     return super(CompetitionGymnastManager, self).get_queryset().filter(is_scratched=False)

    def get_queryset(self):
        qs = super(CompetitionGymnastManager, self).get_queryset().filter(is_scratched=False)
        # request = get_request()
        try:
            # current_meet = Meet.objects.get(id=request.session['meet']['id'])
            current_meet = Meet.objects.get(is_current_meet=True)[0]
            return qs.filter(meet=current_meet)
        except: pass
        return qs


class Gymnast(Gymnast):
    objects = CompetitionGymnastManager()

    class Meta:
        proxy = True
        ordering = ('athlete_id', 'last_name', 'first_name', )

    def __str__(self):
        return "{} {}, {} ({})".format(self.athlete_id, self.last_name, self.first_name, self.team)

    def session(self):
        return ""

    @property
    def name_firstlast(self):
        return "{0} {1} {2}".format(self.athlete_id, self.first_name, self.last_name)

    @property
    def name_lastfirst(self):
        return "{0} {2}, {1}".format(self.athlete_id, self.first_name, self.last_name)


class Team(Team):
    pass

    objects = MeetManager()

    class Meta:
        proxy = True


class LEDShow(models.Model):
    name = models.CharField(max_length=255)

    def __str__(self):
        return self.name

    class Meta:
        verbose_name = "LED show"
        verbose_name_plural = "LED shows"


class LEDShowMessage(models.Model):
    led_sign = models.ForeignKey(LEDSign)
    led_show = models.ForeignKey(LEDShow, related_name='messages')
    message = models.TextField()

    def __str__(self):
        return str(self.id)


def populate_athlete(instance, created, raw, **kwargs):
    # Ignore fixtures and saves for existing courses.
    if not created or raw:
        return

    instance.save()

    meet = Meet.objects.get(is_current_meet=True)
    for event in Event.objects.filter(meet=meet):
        ae = GymnastEvent.objects.get_or_create(event=event, gymnast=instance, meet=meet)
        if instance.is_scratched:
            ae.score = 0
            ae.save()


def populate_event(instance, created, raw, **kwargs):
    # Ignore fixtures and saves for existing courses.
    if not created or raw:
        return

    instance.save()

    meet = Meet.objects.get(is_current_meet=True)
    for athlete in Gymnast.objects.filter(meet=meet):
        ae = GymnastEvent.objects.get_or_create(event=instance, gymnast=athlete, meet=meet)
        if athlete.is_scratched:
            ae.score = 0
            ae.save()


def scratch(instance, created, raw, **kwargs):
    if instance.is_scratched:
        ae = instance.events.all().exclude(score__isnull=False)
        ae.update(score=0)


def update_rankings(sender, instance, created, raw, using, update_fields, **kwargs):
    post_save.disconnect(
        None,
        sender=GymnastEvent,
        dispatch_uid='update_rankings')

    if update_fields is None or 'rank' not in update_fields:
        gymnast_events = GymnastEvent.objects.filter(gymnast=instance.gymnast).order_by("score")
        tie_break = 0

        p = 0
        for gymnast_event in gymnast_events:
            if gymnast_event.score is not None:
                tie_break += int(int(gymnast_event.score * 10) * math.pow(10, p))
            p += 3

        instance.gymnast.tie_break = tie_break
        instance.gymnast.save()

        ranking.update_division_ranking(instance.gymnast.division)
        print(Fore.GREEN + 'Updating {} {} ({}): {} - {}'.format(
            instance.gymnast.first_name,
            instance.gymnast.last_name,
            instance.gymnast.team,
            instance.event.name,
            instance.score
            ) + Fore.RESET)

    post_save.connect(
        update_rankings,
        sender=GymnastEvent,
        dispatch_uid='update_rankings')

post_save.connect(
    scratch,
    sender=Gymnast,
    dispatch_uid='scratch')

post_save.connect(
    populate_athlete,
    sender=Gymnast,
    dispatch_uid='populate_athlete')

# post_save.connect(
#     populate_event,
#     sender=Event,
#     dispatch_uid='populate_event')

post_save.connect(
    update_rankings,
    sender=GymnastEvent,
    dispatch_uid='update_rankings')
