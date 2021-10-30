@echo off

:: Gets all filenames in one line
SETLOCAL EnableDelayedExpansion
set FILELIST=
for /f "delims=|" %%f in ('dir /b *.swift') do ( set "FILELIST=!FILELIST! %%f")
set FILELIST=%FILELIST:,,=%

:: Current folder
:: FOR /F %%i IN ('cd') DO set DIRECTORY=%%~nxi

:: Set up swift variables
set SDKROOT=C:\Library\Developer\Platforms\Windows.platform\Developer\SDKs\Windows.sdk
set SWIFTFLAGS=-sdk %SDKROOT% -resource-dir %SDKROOT%\usr\lib\swift -I %SDKROOT%\usr\lib\swift -L %SDKROOT%\usr\lib\swift\windows

:: Build Swift
swiftc -o main.exe %FILELIST% %SWIFTFLAGS%
