@echo off
title CEdev asm/C/C++ Toolchain

rem Check if we're running Windows 10 or newer.
rem Early versions of Windows 10 didn't support ANSI, but since MS is very aggressive
rem about forcing updates, they're probably not likely to appear.
for /f "tokens=4-5 delims=. " %%i in ('ver') do set VERSION=%%i

rem set codepage to 437 (ansi)
chcp 437 > nul 

echo.
if %VERSION% gtr 9 echo [7m
echo       _______ 
echo      /ÄÄÄÄÄÄ//  ____   _____       _               
echo     /______//  / ___^| ^| ____^|   __^| ^|   ___  __   __ 
echo    /......//  ^| ^|     ^|  _^|    / _` ^|  / _ \ \ \ / /
echo   /......//   ^| ^|___  ^| ^|___  ^| (_^| ^| ^|  __/  \ V / 
echo  /......//     \____^| ^|_____^|  \__,_^|  \___^|   \_/ 
echo /______//       TI-84 Plus CE Developer Toolchain

if %VERSION% gtr 9 echo [0m
echo.

rem Set up path variable
set CEDEV=%~dp0
set PATH=%~dp0bin;%PATH%
rem set PREFIX=%~dp0

if NOT "%CEDEV%"=="%CEDEV: =%" goto spaces

rem If a directory was dragged onto this batch file, then run make on the directory.
if "%~1" == "" goto noargs
cd %1
make
echo.
if %VERSION% gtr 9 echo [92m
echo ____________________________________________________________
echo Make Completed. Check for Compilation Errors/Warnings above.                   
if %VERSION% gtr 9 echo [0m
echo.
pause
exit

:spaces
echo Path: %~dp0
echo.
if %VERSION% gtr 9 echo [101m[30m
echo ERROR: There are spaces in your path!                     
echo Makefiles are incompatible with spaces in folder names.
echo Please rename the directories or move the project files to compile.
if %VERSION% gtr 9 echo [0m
echo.
pause
exit

rem Otherwise, just open a command prompt for the user.
:noargs
echo     Use the 'cd' command to navigate to a CE project folder.
echo     Use the 'dir' command to list the contents of a folder.
echo     Use the 'make' command to build CE projects.
echo     Example projects can be found in the 'examples' folder.
echo     For instance, build the "Hello World" example by executing:
echo.
echo         cedev make examples\hello_world
echo.
echo     Alternatively, drag-and-drop a CE project folder onto this script to build it.
echo.
cmd /k
