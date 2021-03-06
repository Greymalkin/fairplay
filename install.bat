@echo off
echo This application will install Fairplay.
echo.
pause
echo Installing Fairplay . . .
del /Q fairplay\fairplay_db >nul 2>&1
rmdir /S /Q venv >nul 2>&1
python -m venv venv
cmd.exe /c venv\Scripts\activate.bat & pip install -r requirements\windows.txt
cls
cd fairplay
echo Setting up Fairplay database . . . 
cmd.exe /c ..\venv\Scripts\activate.bat & python manage.py migrate --settings=fairplay.settings.windows
cls
echo Creating new admin user for Fairplay . . .
cmd.exe /c ..\venv\Scripts\activate.bat & python manage.py createsuperuser --username=admin --email=admin@admin.com --settings=fairplay.settings.windows
pause