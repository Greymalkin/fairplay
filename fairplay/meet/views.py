import sys
import io
import os
import zipfile
import tempfile
import shutil

from rest_framework import viewsets, status
from rest_framework.response import Response
from rest_framework.decorators import detail_route
from rest_framework.permissions import IsAuthenticated
from rest_framework.parsers import FormParser, MultiPartParser

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
        This takes a while
    """
    dirname = os.path.dirname(settings.BASE_DIR)
    try:
        os.mkdir(os.path.join(dirname, 'fixtures/current_meet'))
    except Exception:
        pass
    call_command('export_current_meet')

    current_meetdir = os.path.join(dirname, 'fixtures/current_meet')
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
    shutil.rmtree(current_meetdir)
    # messages.add_message(request, messages.INFO, 'Current meet exported')
    return response


def get_current_meet_count():
    """ Used to control display/hide behavior of aspects of the dashboard """
    return models.Meet.objects.filter(is_current_meet=True).count()


def no_meets_at_all():
    """ Used to control display/hide behavior of aspects of the dashboard """
    return False if models.Meet.objects.all().count() > 0 else True


def get_meet(column):
    meet = models.Meet.objects.filter(is_current_meet=True).values(column)
    return meet


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
            "event_award_percentage": meet.event_award_percentage * 100,
            "all_around_award_percentage": meet.all_around_award_percentage * 100,
            "team_award_percentage": meet.team_award_percentage * 100

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


class ImportFairplayViewSet(viewsets.ModelViewSet):
    queryset = models.ImportFairplayMeetArchive.objects.all()
    serializer_class = serializers.MeetSerializer
    parser_classes = (FormParser, MultiPartParser,)
    allowed_methods = ('POST', 'PUT')

    def create(self, request):
        try:
            # pull the uploaded file object from the request
            file_obj = request.data['file'].read()
            print(request.data['file'].name.lower())

            # test for .zip
            if not request.data['file'].name.lower().endswith('.zip'):
                messages.add_message(request, messages.ERROR, 'Please upload a zip file.')
                return Response({"message": "Not a zip file."}, status=status.HTTP_200_OK)
        except Exception:
            messages.add_message(request, messages.ERROR, 'Not a Fairplay meet archive: Not a valid zip file.')
            return Response({"message": "Not a valid zip file."}, status=status.HTTP_200_OK)

        # move uploaded file
        dirname = os.path.dirname(settings.BASE_DIR)
        destination_file_path = os.path.join(dirname, "fixtures/current_meet_archive.zip")
        try:
            os.mkdir(os.path.join(dirname, 'fixtures/current_meet'))
        except Exception:
            pass
        destination = open(destination_file_path, 'wb+')
        destination.write(file_obj)
        destination.close()

        # Unzip archive
        with zipfile.ZipFile(destination_file_path) as myzip:
            for name in myzip.namelist():
                # quick test... TODO make more rigorous?
                if name.endswith('.json') or name.endswith('.csv'):
                    print(name)
                    outfile = open(os.path.join(dirname, 'fixtures/current_meet/{}'.format(name)), 'wb')
                    outfile.write(myzip.read(name))
                    outfile.close()

        # run load data on unpacked fixtures
        call_command('import_current_meet')

        # clean up
        os.remove(destination_file_path)
        shutil.rmtree(os.path.join(dirname, 'fixtures/current_meet'))

        messages.add_message(request, messages.SUCCESS, 'Fairplay meet imported from backup archive.')
        return Response({"message": "Fairplay meet imported from backup archive."}, status=status.HTTP_201_CREATED)
