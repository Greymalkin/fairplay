import datetime
from django.db import models


class Meet(models.Model):
    name = models.CharField(max_length=200, blank=False, null=False)
    short_name = models.CharField(max_length=100, blank=False, null=False)
    host = models.CharField(max_length=200, blank=False, null=False)
    date = models.DateField()
    is_current_meet = models.BooleanField('Current Meet?', default=False)
    event_award_percentage = models.FloatField(default=0.45)
    all_around_award_percentage = models.FloatField(default=0.5)

    # max_sessions_per_day = models.IntegerField(
    #     "Max Sessions",
    #     default=3,
    #     help_text="Maximum number of sessions per day.")
    # flow_thresh_min = models.IntegerField(
    #     "Session threshold, minimum achieved number",
    #     default=10,
    #     help_text="Might be useful to show a warning or indicator in the admin when a level/division of gymnasts is getting close to numbers that won't fit neatly in a session.  We need to know when sessions could be getting too big.  Shut down registration?  Have two sessions for the same combination of level/division? These numbers are for meet flow. You also have to keep in mind seating.")
    # flow_thresh_max = models.IntegerField(
    #     "Session threshold, maximum number",
    #     default=15,
    #     help_text="Just because the maxiumum number has been met doesn't mean we'll absolutely stop registering gymnasts, but we should know we are in a situation. We might do want to stop registration for this level/division, depending on how other numbers look.")
    notes = models.TextField(null=True, blank=True)

    class Meta:
        verbose_name = 'Meet'
        verbose_name_plural = 'Meets'
        ordering = ('-is_current_meet', 'name')

    def __str__(self):
        return '{} {}'.format(self.short_name, self.date.strftime('%Y-%m-%d'))
