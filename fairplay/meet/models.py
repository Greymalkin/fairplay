from django.db import models
from request_provider.signals import get_request


class Meet(models.Model):
    name = models.CharField(max_length=200, blank=False, null=False)
    short_name = models.CharField(max_length=100, blank=False, null=False)
    host = models.CharField(max_length=200, blank=False, null=False)
    date = models.DateField()
    is_current_meet = models.BooleanField('Current Meet?', default=False)
    enable_ranking = models.BooleanField(
        'Ranking',
        default=False,
        help_text='''When turned on, scores saved to the cms will cause ranks to adjust.
            Must be turned on while the meet is running.
            When turned off, admin will load more quickly.''')
    event_award_percentage = models.FloatField(default=0.45)
    all_around_award_percentage = models.FloatField(default=0.5)
    notes = models.TextField(null=True, blank=True)

    class Meta:
        verbose_name = 'Meet'
        verbose_name_plural = 'Meets'
        ordering = ('-is_current_meet', 'name')

    def __str__(self):
        return '{}'.format(self.short_name)


# Restrict display of items in the admin by those belonging to the current Meet

class MeetManager(models.Manager):
    def get_queryset(self):
        qs = super(MeetManager, self).get_queryset()

        try:
            current_meet = Meet.objects.get(is_current_meet=True)
            return qs.filter(meet=current_meet)
        except:
            pass
        return qs



