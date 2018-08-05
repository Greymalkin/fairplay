@echo off
echo Starting Fairplay . . .
set FAIRPLAY="runserver"
cd fairplay
cmd.exe /c ..\venv\Scripts\activate.bat & python manage.py runserver 0.0.0.0:8000 --settings=fairplay.settings.windows
echo All done!
pause