@echo off
setlocal

set TARGET=%APPDATA%\kingdom_rush_origins

if not exist "%TARGET%" mkdir "%TARGET%"

copy /Y "%~dp0mod.lua" "%TARGET%\mod.lua"
copy /Y "%~dp0settings.lua" "%TARGET%\settings.lua"

echo.
echo Installed 2x Speed Mod to %TARGET%
echo.
pause
