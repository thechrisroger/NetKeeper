%acquire administrator privilege%
@echo off
cd /d "%~dp0"
cacls.exe "%SystemDrive%\System Volume Information" >nul 2>nul
if %errorlevel%==0 goto Admin
if exist "%temp%\getadmin.vbs" del /f /q "%temp%\getadmin.vbs"
echo Set RequestUAC = CreateObject^("Shell.Application"^)>"%temp%\getadmin.vbs"
echo RequestUAC.ShellExecute "%~s0","","","runas",1 >>"%temp%\getadmin.vbs"
echo WScript.Quit >>"%temp%\getadmin.vbs"
"%temp%\getadmin.vbs" /f
if exist "%temp%\getadmin.vbs" del /f /q "%temp%\getadmin.vbs"
exit
:Admin
%kill process NK.exe%
cd C:\Program Files\NetKeeper%directory of NetKeeper%
echo Starting NetKeeper
ipconfig/flushdns
@echo off 
start NetKeeper.exe
pause
taskkill /F /IM NK.exe /T   %may also  be netkeeper.exe%
echo NetKeeper has been terminated,you can establish wifi now
@echo off   
@ping 127.0.0.1 -n 3 >nul    
exit