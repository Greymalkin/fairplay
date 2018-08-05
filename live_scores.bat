@echo off
echo Starting to send live scores to website . . .
set /p session=Session #: 
cd fairplay
cmd.exe /c ..\venv\Scripts\activate.bat & python manage.py upload_scores %session% --settings=fairplay.settings.windows
echo Stopping . . .
pause