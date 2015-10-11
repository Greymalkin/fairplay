from django import forms
# from django.forms.widgets import SplitDateTimeWidget, DateTimeInput
from . import models

class ShirtChoiceForm(forms.ModelForm):
    pass

    class Meta:
        model = models.Gymnast
        fields = ('shirt',)

