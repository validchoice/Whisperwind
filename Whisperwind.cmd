@echo off
title Whisperwind 

chcp 65001 >nul 
setlocal enabledelayedexpansion 

set y=
for /f %%i in (
    'echo prompt $E ^| cmd'
    ) do (
    set y=%%i
) 

set blue=!y![36m
set reset=!y![0m 

for /d %%i in (
    "%localappdata%\Roblox\Versions\*"
) do (
    if exist "%%i\AppSettings.xml" (
        set cs=%%i 
        goto main
    )
) 

for /d %%i in (
    "C:\Program Files\Roblox\Versions\*"
) do (
    if exist "%%i\AppSettings.xml" (
        set cs=%%i 
        goto main
    )
) 

for /d %%i in (
    "C:\Program Files (x86)\Roblox\Versions\*"
) do (
    if exist "%%i\AppSettings.xml" (
        set cs=%%i 
        goto main
    )
)

:: echo womp womp your roblox is not even found 
echo.
echo Whisper requires Roblox to apply ClientSettings but it doesn't seem to be available.
echo.
echo Roblox could be installed via RobloxPlayerInstaller
echo.
echo 1) Install Roblox via RobloxPlayerInstaller
echo.
echo 2) Use Bloxstrap version (Starling) 
echo.
set /p a=
echo.

if "!a!" equ "1" (
    start "" "https://roblox.com/download"
    echo Once you finished installation, press any key to continue... & pause >nul
    echo Great, Roblox is successfully installed.
    timeout /t 3 /nobreak >nul & goto main
) 

if "!a!" equ "2" (
    echo This is not the place where your looking for, use Starling instead.
    timeout /t 2 /nobreak >nul
    start "" "https://github.com/validchoice/Starling/blob/main/Starling.cmd"
    exit
) 

:: If you saw that 'womp womp' I apologize :(

if exist "!cs!\ClientSettings" (
    mkdir "%~dp0\Backup"
    xcopy "!cs!\ClientSettings" "%~dp0\Backup"
) else ( 
    :: echo womp womp where's your ClientSettings folder at
    mkdir "!cs!\ClientSettings"
) 

:: Before proceed, please make sure you check available commands by typinh 'help' (! case insensitive !)

:main 
cls 
echo.
echo ┌── !blue!Whisperwind!reset!
set /p x="└─$ "

if /i "!x!" equ "help" (
    goto helpcmd
) 

if /i "!x!" equ "1" (
    goto balanced
) 

if "!x!" equ "2" (
    goto normal
) 

if "!x!" equ "3" (
    goto potato
) 

if "!x!" equ "cs" (
    start "" ""
)

echo nuh uh '!x!' is not a valid option 
timeout /t 2 /nobreak >nul & goto main

:: I didn't copy Starling for this

:helpcmd
cls 
echo.
echo Oh, hey^^!
echo.
echo It seems like you either forgot or are new to Whisperwind commands.
echo.
echo Don't worry, I will guide you through those commands.
echo.
echo.
echo 1                                         Import ClientSettings - Balanced 
echo.
echo 2                                         Import ClientSettings - Normal 
echo.
echo 3                                         Import ClientSettings - Potato
echo.
echo cs                                        Open ClientSettings folder 
echo.
echo You may press any key to leave & pause >nul & goto main 


:balanced 
cls 
echo.
echo Applying balanced graphics... 
:: And no, I didn't copy this from Starling either
curl -s -o "!cs!\ClientSettings\ClientAppSettings.json" "https://raw.githubusercontent.com/validchoice/Starling/main/cs/balanced.json"
echo Done^^! 
echo Finished applied balanced graphics^^!
timeout /t 3 /nobreak >nul & goto main
:: echo womp womp that was fast 


:normal 
cls 
echo.
echo Applying normal graphics...
:: For the people that are curious what normal graphics is for, it stops Roblox from tracking you (not fully | support on other graphics too) 
curl -s -o "!cs!\ClientSettings\ClientAppSettings.json" "https://raw.githubusercontent.com/validchoice/Starling/main/cs/normal.json"
echo Done^^! 
echo Finished applied normal graphics^^! 
timeout /t 3 /nobreak >nul & goto main 


:potato 
cls 
echo.
echo Applying potato graphics... 
:: Voxelizer is not included in potato graphics 
curl -s -o "!cs!\ClientSettings\ClientAppSettings.json" "https://raw.githubusercontent.com/validchoice/Starling/main/cs/potato.json"
echo Done^^! 
echo Finished applied potato graphics^^! 
timeout /t 3 /nobreak >nul & goto main 
