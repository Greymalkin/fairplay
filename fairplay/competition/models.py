import math
from colorama import Fore
from django.db import models
from django.db.models import Count, Sum, F
from django.db.models.signals import post_save

from meet.models import Meet, MeetManager
from registration.models import Team, Level
from registration.models import Gymnast as MasterGymnast
from . import ranking


class EventManager(models.Manager):
    def get_by_natural_key(self, name, initials, is_mag, is_wag):
        return self.get(name=name, initials=initials, is_mag=is_mag, is_wag=is_wag)


class Event(models.Model):
    objects = EventManager()

    # TODO Foreign Key to registration.Discipline
    # TODO turn is_mag and is_wag fields into properties based on Discipline
    order = models.PositiveSmallIntegerField()
    name = models.CharField(max_length=255, help_text="Event name")
    initials = models.CharField(max_length=2, help_text="Event initials")
    sign = models.ForeignKey("LEDSign", blank=True, null=True, on_delete=models.SET_NULL)
    active = models.BooleanField(
        default=True,
        help_text="Event is included as part of this meet")
    is_mag = models.BooleanField(
        "MAG",
        default=True,
        help_text="Men's Artistic Gymnastics Event")
    is_wag = models.BooleanField(
        "WAG",
        default=True,
        help_text="Women's Artistic Gymnastics Event")

    class Meta():
        ordering = ['order', ]

    def __str__(self):
        return self.name

    def natural_key(self):
        return (self.name, self.initials, self.is_mag, self.is_wag)

    # TODO figuring out the rotation using these methods will break if a meet has both wag & mag events

    @property
    def warmup_event_starthere(self):
        """ Traditional Format. If this is where you start your warmup, where will your first event rotation be? """
        warmup = None
        try:
            warmup = Event.objects.filter(active=True, order__gt=self.order)[0]  # competition.Event
        except Exception:
            warmup = Event.objects.filter(active=True).order_by('order')[0]  # competition.Event
        return warmup

    @property
    def warmup_event_endhere(self):
        """ Traditional Format. Where do you start your warmup if you need to end warmup at THIS, your first event rotation? """
        warmup = None
        try:
            warmup = Event.objects.filter(active=True, order__lt=self.order).order_by('-order')[0]    # competition.Event
        except Exception:
            warmup = Event.objects.filter(active=True).order_by('-order')[0]    # competition.Event
        return warmup


class ScoreRankEventManager(models.Manager):
    def get_by_natural_key(self, meet, team, last_name, first_name, discipline, usag):
        return self.get(
            meet__name=meet,
            team__gym=team,
            last_name=last_name,
            first_name=first_name,
            discipline=discipline,
            usag=usag)


class ScoreRankEvent(models.Model):
    ''' Pivoted version of the scores stored as rows in the GymnastEvent model.
        Populated via Signal on GymnastEvent '''
    meet = models.ForeignKey(Meet, related_name='scores')
    gymnast = models.OneToOneField(MasterGymnast, related_name="scores")
    fx = models.FloatField(null=True, blank=True)
    ph = models.FloatField(null=True, blank=True)
    sr = models.FloatField(null=True, blank=True)
    vt = models.FloatField(null=True, blank=True)
    pb = models.FloatField(null=True, blank=True)
    hb = models.FloatField(null=True, blank=True)
    ub = models.FloatField(null=True, blank=True)
    bb = models.FloatField(null=True, blank=True)

    objects = MeetManager()

    class Meta():
        unique_together = ('gymnast', 'meet')

    def __str__(self):
        return self.gymnast.__str__()

    def natural_key(self):
        return (self.meet.name, self.team.gym, self.last_name, self.first_name, self.discipline, self.usag)


class DivisionManager(MeetManager):
    def get_by_natural_key(self, meet, level, name):
        return self.get(meet__name=meet, level__name=level, name=name)

    def get_queryset(self):
        qs = super(DivisionManager, self).get_queryset()
        qs.select_related('level')
        return qs


class Division(models.Model):
    # TODO Foreign Key to registration.Discipline
    objects = DivisionManager()
    meet = models.ForeignKey(Meet, related_name='divisions')
    level = models.ForeignKey(Level, related_name='divisions', blank=False, null=True)
    name = models.CharField(max_length=50)
    short_name = models.CharField(max_length=10, help_text='For printing in report columns.')
    min_age = models.PositiveSmallIntegerField(default=6)
    max_age = models.PositiveSmallIntegerField(default=18)
    event_award_count = models.PositiveSmallIntegerField(
        default=3,
        help_text="Number of places individual awards will go out to")
    all_around_award_count = models.PositiveSmallIntegerField(
        verbose_name="All-around award count",
        default=3,
        help_text="Number of places all around awards will go out to")

    class Meta():
        ordering = ['level', 'min_age', ]
        verbose_name = 'Age Division'
        verbose_name_plural = 'Age Divisions'

    def __str__(self):
        age = self.min_age
        if self.min_age != self.max_age:
            age = '{}-{}'.format(self.min_age, self.max_age)
        level = self.level.name.upper() if self.level.level == 999 else 'Level {}'.format(self.level)
        return "{} ({} years)".format(level, age)

    def natural_key(self):
            return (self.meet.name, self.level.name, self.name)

    def title(self):
        level = self.level.name.upper() if self.level.level == 999 else 'Level {}'.format(self.level.level)
        return "{} ({})".format(level, self.name)

    def age_division(self):
        age_division = self.min_age
        if self.min_age != self.max_age:
            age_division = '{}-{}'.format(self.min_age, self.max_age)
        return age_division

    def num_gymnasts(self):
        return self.gymnasts.filter(is_scratched=False).count()
    num_gymnasts.short_description = "Gymnasts"


def total_meet_medals(details=False):
    ''' For individual medals, count the number of awards we are giving in each division
            and multiply by the number of events
        For all around medals, count the number of awards we are giving in each division
            and subtract 3 for each division, as 1st-3rd place get trophies '''
    medalsa = Division.objects.exclude(event_award_count__lte=3).\
    aggregate(
        num_divisions_indiv_other_places=Count('name'),
        indiv_other_place_medals=(Sum(F('event_award_count') * 6) - (Count('name') * 3 * 6)),
    )

    medalsb = Division.objects.exclude(all_around_award_count__lte=3).\
    aggregate(
        num_divisions_aa_other_places=Count('name'),
        aa_other_place_medals=(Sum('all_around_award_count') - (Count('name') * 3))
    )
    medalsc = Division.objects.all().\
        aggregate(
            num_divisions_total=Count('name'),
            indiv_top_3_total=Count('name') * 6 * 3,
            aa_top_3_total=Count('name') * 3,
            total_awards=Sum('all_around_award_count') + Sum(F('event_award_count') * 6)
    )
    medals = {}
    medals.update(medalsa)
    medals.update(medalsb)
    medals.update(medalsc)
    try:
        medals['total_awards'] = medalsa['indiv_other_place_medals'] + medalsb['aa_other_place_medals'] + medalsc['indiv_top_3_total'] + medalsc['aa_top_3_total']
    except Exception:
        medals['total_awards'] = 0
    if details:
        return medals
    if medals['total_awards'] < 0:
        return 0
    return medals['total_awards']


class SessionManager(MeetManager):
    def get_by_natural_key(self, meet, name):
        return self.get(meet__name=meet, name=name)

    def get_queryset(self):
        qs = super(SessionManager, self).get_queryset()
        qs.prefetch_related('divisions')
        return qs


class Session(models.Model):
    meet = models.ForeignKey(Meet, related_name='sessions')
    name = models.CharField(max_length=255, help_text="Session 1, Session 2, etc.")
    divisions = models.ManyToManyField(
        Division,
        related_name='session',
        blank=True,
        help_text="""
        Select from the list on the left which age divisions will compete in this session.
        All gymnasts in the selected age division will be automatically assigned to this session.
        Age divisions may not be split across multiple sessions.""")
    TRADITIONAL = 'Traditional'
    COMPETE = 'Warm-up/Compete'
    WARMUP = ((TRADITIONAL, TRADITIONAL), (COMPETE, COMPETE))
    warmup = models.CharField('Session Flow', max_length=25, choices=WARMUP, default=TRADITIONAL)
    session_start = models.DateTimeField('Session Start Time', blank=True, null=True)
    timed_warmup_start = models.TimeField('Timed Warmup Start Time', blank=True, null=True)
    competition_start = models.TimeField('Competition Start Time', blank=True, null=True)
    presentation_start = models.TimeField('Presentation of Teams Start Time', blank=True, null=True)

    objects = SessionManager()

    class Meta():
        ordering = ['name', ]
        verbose_name = "Session"
        verbose_name_plural = "Sessions"

    def __str__(self):
        return self.name

    def natural_key(self):
            return (self.meet.name, self.name)

    def num_gymnasts(self):
        try:
            num_gymnasts = [a.gymnasts.filter(is_scratched=False).count() for a in self.divisions.all()]
            num_gymnasts = (sum(num_gymnasts))
            return num_gymnasts
        except Exception:
            return 0
    num_gymnasts.short_description = "Gymnasts"

    @property
    def levels(self):
        levels = self.divisions.order_by('level_id').distinct('level_id').values_list('level__name', flat=True)
        return levels

    @property
    def level_groups(self):
        levels = self.divisions.order_by('level_group').distinct('level_group').values_list('level__group', flat=True)
        return levels

    @property
    def level_divisions(self):
        levels = self.divisions.order_by('level_id').distinct('level_id').values_list('level__name', flat=True)
        return levels

    @property
    def division_list(self):
        return self.divisions.values_list('name', flat=True)


class TeamAwardManager(MeetManager):
    def get_by_natural_key(self, meet, name):
        return self.get(meet__name=meet, name=name)


class TeamAward(models.Model):
    meet = models.ForeignKey(Meet, related_name='team_awards')
    name = models.CharField(max_length=255)
    levels = models.ManyToManyField(Level, related_name='team_awards', blank=False)
    award_count = models.PositiveSmallIntegerField(default=0, help_text='Number of places team awards will go out to')
    order = models.PositiveSmallIntegerField(default=0)

    objects = TeamAwardManager()

    class Meta:
        verbose_name = "Team Award"
        verbose_name_plural = "Team Awards"
        ordering = ['order']

    def __str__(self):
        return self.name

    def natural_key(self):
            return (self.meet.name, self.name)

    def registered_teams(self):
        ''' Used to create a report. Which team, that has paid to register for team awards,
            has the largest number of gymnasts? Some awards span levels, as in the Level 9/10 award '''
        try:
            teams = Team.objects.filter(
                team_awards=self,
                gymnasts__is_scratched=False,
                gymnasts__level__group__in=self.levels.all()
                .values('group')).annotate(num_gymnasts=Count('id'))
            return teams
        except Exception:
            return Team.objects.filter(id=0).annotate(num_gymnasts=Count('id'))

    def qualified_teams(self):
        ''' Same as registered teams, except filtered for at least 3 gymnast.
            If you registered but don't end up with three gymnast, you aren't getting a team award. '''
        try:
            teams = Team.objects.filter(
                team_awards=self,
                gymnasts__is_scratched=False,
                gymnasts__level__group__in=self.levels.all()
                .values('group')).annotate(num_gymnasts=Count('id')).filter(num_gymnasts__gte=3)
            return teams
        except Exception:
            return Team.objects.filter(id=0).annotate(num_gymnasts=Count('id'))


class TeamAwardRankManager(MeetManager):
    def get_by_natural_key(self, meet, team, team_award):
        return self.get(meet__name=meet, team__gym=team, team_award__name=team_award)


class TeamAwardRank(models.Model):
    meet = models.ForeignKey(Meet, related_name='team_ranks')
    team = models.ForeignKey(Team, related_name='team_ranks')
    team_award = models.ForeignKey(TeamAward, related_name='team_ranks')
    rank = models.PositiveSmallIntegerField(null=True)
    score = models.FloatField(null=True)

    objects = TeamAwardRankManager()

    def __str__(self):
        return "{} - {}".format(self.team_award, self.team)

    def natural_key(self):
            return (self.meet.name, self.team.gym, self.team_award.name)

    class Meta:
        verbose_name = 'Team Awards > Rank > Score'
        verbose_name_plural = 'Team Awards > Rank > Score'


class TeamAwardRankEventManager(MeetManager):
    def get_by_natural_key(self, meet, team_award, team, event, usag):
        return self.get(
            meet__name=meet,
            team_award_rank__team_award__name=team_award,
            team_award_rank__team__gym=team,
            event=event,
            gymnast_event__gymnast__usag=usag)


class TeamAwardRankEvent(models.Model):
    meet = models.ForeignKey(Meet, related_name='team_event_rankings')
    team_award_rank = models.ForeignKey(TeamAwardRank, related_name='team_event_rankings')
    event = models.ForeignKey('Event', related_name='team_event_rankings')
    gymnast_event = models.ForeignKey('GymnastEvent', related_name='team_event_rankings')
    rank = models.PositiveSmallIntegerField(null=True)

    objects = TeamAwardRankEventManager()

    def __str__(self):
        return "{} - {} - {} - {} ({})".format(self.team_award_rank.team_award, self.team_award_rank.team, self.event, self.gymnast_event.gymnast, self.rank)

    def natural_key(self):
            return (
                self.meet.name,
                self.team_award_rank.team_award.name,
                self.team_award_rank.team.gym,
                self.event,
                self.gymnast_event.gymnast.usag)

    class Meta:
        verbose_name = 'Team Awards > Rank > Event > Gymnast'
        verbose_name_plural = 'Team Awards > Rank > Event > Gymnast'


class GymnastEventManager(MeetManager):
    def get_by_natural_key(self, meet, gymnast_last_name, gymnast_first_name, gymnast_usag, event, event_mag, event_wag):
        return self.get(
            meet__name=meet,
            gymnast__last_name=gymnast_last_name,
            gymnast__first_name=gymnast_first_name,
            gymnast__usag=gymnast_usag,
            event__name=event,
            event__is_mag=event_mag,
            event__is_wag=event_wag)

    def get_queryset(self):
        qs = super(GymnastEventManager, self).get_queryset()
        qs.select_related('gymnast', 'event')
        return qs


class GymnastEvent(models.Model):
    meet = models.ForeignKey(Meet, related_name='gymnast_events')
    gymnast = models.ForeignKey(MasterGymnast, related_name="events")
    event = models.ForeignKey(Event, related_name="gymnasts")
    score = models.FloatField(null=True, blank=True)
    rank = models.PositiveSmallIntegerField(null=True)
    place = models.PositiveSmallIntegerField(null=True)

    objects = GymnastEventManager()

    class Meta():
        verbose_name = 'Gymnast Event'
        verbose_name_plural = 'Gymnast Events > Rank > Score > Place'
        ordering = ['gymnast', 'event']
        unique_together = ('gymnast', 'event',)

    def __str__(self):
        return "{} - {} - {}".format(
            self.gymnast,
            self.event,
            self.score)

    def natural_key(self):
        return (
            self.meet.name,
            self.gymnast.last_name,
            self.gymnast.first_name,
            self.gymnast.usag,
            self.event.name,
            self.event.is_mag,
            self.event.is_wag)

# Proxy models from Registration, used to create competition specific admins and behavior


class CompetitionGymnastManager(MeetManager):
    def get_queryset(self):
        qs = super(CompetitionGymnastManager, self).get_queryset().filter(is_scratched=False, usag__isnull=False)
        return qs


class Gymnast(MasterGymnast):
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


class MensArtisticGymnastManager(MeetManager):
    def get_queryset(self):
        qs = super(MensArtisticGymnastManager, self).get_queryset().filter(is_scratched=False, discipline='mag', usag__isnull=False)
        return qs


class MensArtisticGymnast(MasterGymnast):
    objects = MensArtisticGymnastManager()

    class Meta:
        proxy = True
        ordering = ('athlete_id', 'last_name', 'first_name', )
        verbose_name = 'MAG Gymnast'
        verbose_name_plural = 'Mens Artistic Event Gymnasts'

    def __str__(self):
        return "{} {}, {} ({})".format(self.athlete_id, self.last_name, self.first_name, self.team)

    def sr(self):
        return self.scores.sr
    sr.admin_order_field = 'scores__sr'
    sr.short_description = 'SR'

    def hb(self):
        return self.scores.hb
    hb.admin_order_field = 'scores__hb'
    hb.short_description = 'HB'

    def fx(self):
        return self.scores.fx
    fx.admin_order_field = 'scores__fx'
    fx.short_description = 'FX'

    def pb(self):
        return self.scores.pb
    pb.admin_order_field = 'scores__pb'
    pb.short_description = 'PB'

    def vt(self):
        return self.scores.vt
    vt.admin_order_field = 'scores__vt'
    vt.short_description = 'VT'

    def ph(self):
        return self.scores.ph
    ph.admin_order_field = 'scores__PH'
    ph.short_description = 'PH'


class WomensArtisticGymnastManager(MeetManager):
    def get_queryset(self):
        qs = super(WomensArtisticGymnastManager, self).get_queryset().filter(is_scratched=False, discipline='wag', usag__isnull=False)
        return qs


class WomensArtisticGymnast(MasterGymnast):
    objects = WomensArtisticGymnastManager()

    class Meta:
        proxy = True
        ordering = ('athlete_id', 'last_name', 'first_name', )
        verbose_name = 'WAG Gymnast'
        verbose_name_plural = 'Womens Artistic Event Gymnasts'

    def __str__(self):
        return "{} {}, {} ({})".format(self.athlete_id, self.last_name, self.first_name, self.team)

    def bb(self):
        return self.scores.bb

    def ub(self):
        return self.scores.ub

    def fx(self):
        return self.scores.fx

    def vt(self):
        return self.scores.vt


class Team(Team):
    pass

    objects = MeetManager()

    class Meta:
        proxy = True


# Models for managing the signs that display scores at the meet

class LEDSignManager(models.Manager):
    def get_by_natural_key(self, name, device):
        return self.get(name=name, device=device)


class LEDSign(models.Model):
    name = models.CharField(max_length=255)
    device = models.PositiveSmallIntegerField()
    objects = LEDSignManager()

    def __str__(self):
        return self.name

    def natural_key(self):
            return (self.name, self.device)

    class Meta:
        verbose_name = "LED sign"
        verbose_name_plural = "LED signs"
        unique_together = (('name', 'device'),)


class LEDShowManager(models.Manager):
    def get_by_natural_key(self, name):
        return self.get(name=name)


class LEDShow(models.Model):
    name = models.CharField(max_length=255, unique=True)
    objects = LEDShowManager()

    def __str__(self):
        return self.name

    def natural_key(self):
            return (self.name, )

    class Meta:
        verbose_name = "LED show"
        verbose_name_plural = "LED shows"


class LEDShowMessage(models.Model):
    led_sign = models.ForeignKey(LEDSign)
    led_show = models.ForeignKey(LEDShow, related_name='messages')
    message = models.TextField()

    def __str__(self):
        return str(self.id)


# Signals and Receivers

#  TODO: Don't think this does anything or needs to be here
# def populate_athlete(instance, created, raw, **kwargs):
#     # Ignore fixtures and saves for existing courses.
#     print('**** populate_athlete')
#     if not created or raw:
#         return

#     instance.save()

#     for event in Event.objects.filter(active=True):
#         ae = GymnastEvent.objects.get_or_create(event=event, gymnast=instance)
#         if instance.is_scratched:
#             print('**** populate_athlete')
#             ae.score = 0
#             ae.save()


# def populate_event(instance, created, raw, **kwargs):
#     # Ignore fixtures and saves for existing courses.
#     if not created or raw:
#         return

#     instance.save()

#     meet = Meet.objects.get(is_current_meet=True)
#     for gymnast in Gymnast.objects.filter(meet=meet):
#         ae = GymnastEvent.objects.get_or_create(event=instance, gymnast=gymnast, meet=meet)
#         if gymnast.is_scratched:
#             ae.score = 0
#             ae.save()


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
        score, created = ScoreRankEvent.objects.get_or_create(meet=instance.meet, gymnast=instance.gymnast)
        tie_break = 0

        # same as in Gymnast.compute_tie_break()
        p = 0
        for gymnast_event in gymnast_events:
            if gymnast_event.score is not None:
                tie_break += int(int(gymnast_event.score * 10) * math.pow(10, p))
            p += 3

            # is there a column in ScoreRankEvent that matches gymnast_event initials?  If none, this will fail silently.
            setattr(score, gymnast_event.event.initials, gymnast_event.score)

        instance.gymnast.tie_break = tie_break
        instance.gymnast.save()
        score.save()

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

# post_save.connect(
#     populate_athlete,
#     sender=Gymnast,
#     dispatch_uid='populate_athlete')

# post_save.connect(
#     populate_event,
#     sender=Event,
#     dispatch_uid='populate_event')

post_save.connect(
    update_rankings,
    sender=GymnastEvent,
    dispatch_uid='update_rankings')
