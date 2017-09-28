import sys
import io
import os
import zipfile
import tempfile

from rest_framework import viewsets, status
from rest_framework.response import Response
from rest_framework.decorators import detail_route
from rest_framework.permissions import IsAuthenticated

from django.shortcuts import redirect
from django.conf import settings
from django.contrib import messages
from django.core.management import call_command
from django.http import FileResponse

from . import models, serializers

COMMAND_MAP = {
    'task-a': 'initial_setup_mag',
}


def run_task(request, task):

    if request.user.is_superuser:

        command = COMMAND_MAP.get(task)

        # call_command outputs to stdout - if you want to give feedback in admin you somehow have to capture the output
        old_stdout = sys.stdout
        sys.stdout = my_stdout = io.StringIO()
        call_command(command)
        sys.stdout = old_stdout

        messages.add_message(request, messages.INFO, '{}'.format(my_stdout.getvalue()))

    return redirect('/admin')


def export_current_meet(request):
    """ Generate fixtures of all data associated with the current active meet.
        Zip into archive, download to user.
    """
    # TODO this takes a while.  Would be best as a background process
    call_command('export_current_meet')

    messages.add_message(request, messages.INFO, 'Current meet exported')

    current_meetdir = os.path.dirname(settings.BASE_DIR)
    current_meetdir = os.path.join(current_meetdir, 'fixtures/current_meet')
    temp = tempfile.TemporaryFile()
    newZip = zipfile.ZipFile(temp, 'w', zipfile.ZIP_DEFLATED)

    directory = os.fsencode(current_meetdir)

    for file in os.listdir(directory):
        filename = os.fsdecode(file)
        if '.DS_Store' not in filename:
            newZip.write(os.path.join(current_meetdir, filename), filename)

    newZip.close()
    temp.seek(0)

    # Stream the file back in chunks
    response = FileResponse(temp)
    response['Content-Disposition'] = 'attachment; filename=current_meet_archive.zip'

    return response


def get_current_meet_count():
    """ Used to control display/hide behavior of aspects of the dashboard """
    return models.Meet.objects.filter(is_current_meet=True).count()


def no_meets_at_all():
    """ Used to control display/hide behavior of aspects of the dashboard """
    return False if models.Meet.objects.all().count() > 0 else True


class MeetViewSet(viewsets.ReadOnlyModelViewSet):
    """ Retrieve a meet by its id """
    queryset = models.Meet.objects.all()
    serializer_class = serializers.MeetSerializer
    permission_classes = (IsAuthenticated,)

    @detail_route(methods=['get'], url_path="set")
    def set_active(self, request, pk=None):
        """ Sets a meet as active, storing it in the user's session
        ---
        omit_serializer: true
        """
        try:
            models.Meet.objects.all().exclude(id=int(pk)).update(is_current_meet=False, enable_ranking=False)
            meet = models.Meet.objects.get(id=int(pk))
            meet.is_current_meet = True
            meet.save()
        except Exception:
            request.session['meet'] = {}
            return Response({"status": "active meet cleared"}, status=status.HTTP_200_OK)

        request.session['meet'] = {
            'id': meet.id,
            'name': meet.name,
            'short_name': meet.short_name,
            'enable_ranking': meet.enable_ranking,
        }
        return Response({"status": "active meet: {}".format(request.session['meet'])}, status=status.HTTP_200_OK)

    @detail_route(methods=['get'])
    def toggle_ranking(self, request, pk=None):
        """ Changes the enable_ranking flag to its opposite
        ---
        omit_serializer: true
        """
        try:
            meet = models.Meet.objects.get(id=int(pk))
            meet.enable_ranking = not meet.enable_ranking
            meet.save()
        except Exception:
            request.session['meet'] = {}
            return Response({"status": "no change to enable ranking"}, status=status.HTTP_200_OK)

        if meet.is_current_meet:
            request.session['meet'] = {
                'id': meet.id,
                'name': meet.name,
                'short_name': meet.short_name,
                'enable_ranking': meet.enable_ranking,
            }
        return Response({"status": "enable ranking flag changed to {}".format(meet.enable_ranking)}, status=status.HTTP_200_OK)
