@echo off
cd /d "C:\Users\garyc\Documents\lbrfc-live-scores"

set GIT="C:\Program Files\Git\bin\git.exe"
if not exist %GIT% set GIT="C:\Program Files (x86)\Git\bin\git.exe"

echo ==== %date% %time% ==== >> publish_log.txt

%GIT% add -A >> publish_log.txt 2>&1

%GIT% diff --cached --quiet
if %errorlevel%==0 (
  echo No changes to commit >> publish_log.txt
  exit /b 0
)

%GIT% commit -m "Auto update live scores" >> publish_log.txt 2>&1
%GIT% push origin main >> publish_log.txt 2>&1