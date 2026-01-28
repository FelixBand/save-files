@echo off
setlocal

REM Go to your repo folder
cd /d %USERPROFILE%\github\save-files || (
    echo Failed to change directory.
    exit /b 1
)

REM Add all changes
git add .

REM Create timestamp (YYYY-DD-MM HH:MM:SS)
for /f "tokens=1-3 delims=/- " %%a in ("%date%") do (
    set yyyy=%%c
    set mm=%%a
    set dd=%%b
)
for /f "tokens=1-2 delims=:." %%a in ("%time%") do (
    set hh=%%a
    set min=%%b
)

set commit_msg=Pushed save games - %yyyy%-%dd%-%mm% %hh%:%min%

REM Commit (ignore if nothing to commit)
git commit -m "%commit_msg%" || echo Nothing to commit.

REM Push changes
git push || (
    echo Push failed.
    exit /b 1
)

endlocal
