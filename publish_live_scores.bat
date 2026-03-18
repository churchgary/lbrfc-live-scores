@echo off
cd /d "C:\Users\garyc\Documents\lbrfc-live-scores"

git add -A

git diff --cached --quiet
if %errorlevel%==0 exit /b 0

git commit -m "Auto update live scores"
git push origin main