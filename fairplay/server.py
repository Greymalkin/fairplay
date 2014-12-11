import os
from swampdragon.swampdragon_server import run_server

os.environ.setdefault("DJANGO_SETTINGS_MODULE", "fairplay.settings.local")

run_server()
