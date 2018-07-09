@echo off
echo This application will install Fairplay.
echo.
pause
echo Installing Fairplay . . .
del /Q fairplay\fairplay_db
rmdir /S /Q venv
python -m venv venv
venv\Scripts\activate.bat & pip install -r requirements\windows.txt & cls & echo Setting up Fairplay database . . . & venv\Scripts\activate.bat & cd fairplay & python manage.py migrate --settings=fairplay.settings.windows & cls & echo Creating new admin user for Fairplay . . . & python manage.py createsuperuser --username=admin --email=admin@admin.com --settings=fairplay.settings.windows
pause