from django.contrib import admin
from . import models

class MeetAdmin(admin.ModelAdmin):
    list_display = ('short_name', 'host', 'date', 'is_current_meet', 'event_award_percentage', 'all_around_award_percentage')

    def save_model(self, request, obj, form, change):  
        # only alllow a single default
        if obj.is_current_meet:
            self.model.objects.all().exclude(id=obj.id).update(is_current_meet=False)
        obj.save() 

admin.site.register(models.Meet, MeetAdmin)