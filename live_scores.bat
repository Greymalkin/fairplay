@echo off
echo Starting to send live scores to website . . .
set /p session=Session #: 
venv\Scripts\activate.bat & cd fairplay & python manage.py upload_scores %session% --settings=fairplay.settings.windows & pause