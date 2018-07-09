@echo off
echo Starting Fairplay . . .
set FAIRPLAY="runserver"
venv\Scripts\activate.bat & cd fairplay & python manage.py runserver 0.0.0.0:8000 --settings=fairplay.settings.windows
echo All done!