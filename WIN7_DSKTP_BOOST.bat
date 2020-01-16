@echo off
:: BatchGotAdmin (Run as Admin code starts)
REM --> Check for permissions
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
:: Requesting administrative privileges...
goto UACPrompt
) else ( goto gotAdmin )
:UACPrompt
echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"
"%temp%\getadmin.vbs"
exit /B
:gotAdmin
if exist "%temp%\getadmin.vbs" ( del "%temp%\getadmin.vbs" )
pushd "%CD%"
CD /D "%~dp0"
:: BatchGotAdmin (Run as Admin code ends)
@echo off 
GOTO START
:START
CLS
color e0
title = WINDOWS 7 MAINTENANCE APPLCATION BY RENJITH R
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
echo 	RUN THIS APPICATION WITH YOUR OWN RISK ? 
ECHO.
ECHO.
ECHO.
ECHO				I AGREE		- ENTER 1
ECHO.
ECHO.
ECHO				I NOT AGREE	- ENTER 2
ECHO.
ECHO.
set/p "cho=>"
if %cho%==1 goto REC
if %cho%==2 goto END
echo Invalid choice..
PAUSE
GOTO START
:REC
cls
@echo off
echo.
echo.
echo.
echo	BEFORE YOU START..
echo.
echo.
echo.
echo.
echo.
echo		DO YOU WANT TO CREATE A RESTORE POINT(Recomented)	- ENTER 1
echo.
echo.
echo		EXIT THIS SESSION					- ENTER 2
echo.
echo.
set/p "cho=>"
if %cho%==1 goto RESTORE
if %cho%==2 goto WALL
echo Invalid choice
PAUSE
GOTO REC
:RESTORE
systempropertiesprotection
GOTO WALL
:WALL
cls
@echo off
echo.
echo.
echo.
echo.
echo.
echo.
echo Choose An Option:
echo.
echo.
echo		DISABLE WALLPAPER CHANGING IN YOUR CPC?		- ENTER 1
echo.
echo.
echo		EXIT THIS SESSION				- ENTER 2
echo.
echo.
set/p "cho=>"
if %cho%==1 goto A1
if %cho%==2 goto A2
echo Invalid choice
PAUSE
GOTO WALL
:A1
@echo off
REG QUERY HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\ActiveDesktop /V "NoChangingWallPaper" >nul 2>&1
if %ERRORLEVEL% == 1 REG ADD HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\ActiveDesktop /v "NoChangingWallPaper" /t REG_DWORD /d 1
GOTO A2
:A2
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo Choose An Option:
echo.
echo.
echo		DISABLE THEME CHANGING in your PC  	- ENTER 1
echo.
echo.
echo		EXIT THIS SESSION		  	- ENTER 2
echo.
echo.
set/p "cho=>"
if %cho%==1 goto A3
if %cho%==2 goto A4
echo Invalid choice
PAUSE
GOTO A2
:A3
@echo off
REG QUERY HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer /V "NoThemesTab" >nul 2>&1
if %ERRORLEVEL% == 1 REG ADD HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer /V "NoThemesTab" /t REG_DWORD /d 1
GOTO A4
:A4
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo Choose An Option:
echo.
echo.
echo		DISABLE USB in your PC  	- ENTER 1
echo.
echo.
echo		EXIT THIS SESSION		- ENTER 2
echo.
echo.
set/p "cho=>"
if %cho%==1 goto A5
if %cho%==2 goto A6
echo Invalid choice
PAUSE
GOTO A4
:A5
@echo off
reg add HKLM\SYSTEM\CurrentControlSet\services\USBSTOR /v "Start" /t REG_DWORD /d 4 /f
GOTO A6
:A6
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo Choose An Option:
echo.
echo.
echo		DISABLE ' Facebook ' IN YOUR PC		- ENTER 1
Echo.
echo.
echo		ENABLE ' Facebook ' IN YOUR PC		- ENTER 2
echo.
echo.
echo		EXIT THIS SESSION			- ENTER 3
echo.
echo.
set/p "cho=>"
if %cho%==1 goto A7
if %cho%==2 goto UB
if %cho%==3 goto A8
echo Invalid choice
PAUSE
GOTO A6
:A7
IF NOT EXIST %windir%\SYSTEM32\DRIVERS\ETC\HOSTS >%windir%\SYSTEM32\DRIVERS\ETC\HOSTS ECHO 127.0.0.1 localhost
IF EXIST %windir%\SYSTEM32\DRIVERS\ETC\HOSTS.nbk GOTO A8
IF NOT EXIST %windir%\SYSTEM32\DRIVERS\ETC\HOSTS.nbk GOTO BLOCK
:BLOCK
COPY %windir%\SYSTEM32\DRIVERS\ETC\HOSTS %windir%\SYSTEM32\DRIVERS\ETC\HOSTS.nbk>NUL
>>%windir%\SYSTEM32\DRIVERS\ETC\HOSTS ECHO 127.0.0.1 Facebook.com
>>%windir%\SYSTEM32\DRIVERS\ETC\HOSTS ECHO 127.0.0.1 www.Facebook.com
>>%windir%\SYSTEM32\DRIVERS\ETC\HOSTS ECHO 127.0.0.1 m.facebook.com
>>%windir%\SYSTEM32\DRIVERS\ETC\HOSTS ECHO 127.0.0.1 www.m.facebook.com
IPCONFIG /FLUSHDNS>NUL
GOTO A8
:UB
IF EXIST %windir%\SYSTEM32\DRIVERS\ETC\HOSTS.nbk COPY %windir%\SYSTEM32\DRIVERS\ETC\HOSTS.nbk %windir%\SYSTEM32\DRIVERS\ETC\HOSTS>NUL
DEL %windir%\SYSTEM32\DRIVERS\ETC\HOSTS.nbk
IPCONFIG /FLUSHDNS>NUL
GOTO A8
:A8
cls
echo.
echo.
echo.
echo WHICH ' PERFORMANCE MODE ' WILL YOU PREFER ?
echo.
echo.
echo.
echo.
echo Choose An Option:
echo.
echo.
echo		POWER SAVER		- ENTER 1
echo.
echo.
echo		BALANCED		- ENTER 2
echo.
echo.
echo		HIGH PERFORMANCE	- ENTER 3
echo.
echo.
set/p "cho=>"
if %cho%==1 goto A9
if %cho%==2 goto A10
if %cho%==3 goto A11
echo Invalid choice
PAUSE
GOTO A8
:A9
powercfg.exe /setactive a1841308-3541-4fab-bc81-f71556f20b4a
GOTO A12
:A10
powercfg.exe /setactive 381b4222-f694-41f0-9685-ff5bb260df2e
GOTO A12
:A11
powercfg.exe /setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c
GOTO A12
:A12
cls
echo.
echo.
echo The Following tasks will Execute in this Session..
echo.
echo.
echo		1)  Disable the startup repair screen
echo		2)  Remove all unwanted startup programs
echo		3)  Remove Preftch Data
echo		4)  Remove all Temp Data
echo		5)  Set the windows explorer priority to "Realtime"
echo		6)  Disable Windows Indexing function
echo		7)  Disable Windows Firewall
echo		8)  Force context menus to load faster
echo		9)  Disabling Last Access Update(HDD)
echo		10) Empty all the Recycle Bins
echo		11) Disable windows auto update facility
echo		12) Disable Windows Defender
echo.
echo.
echo Choose An Option:
echo.
echo.
echo		PROCEED WITH SYSTEM MAINTENANCE  	- ENTER 1
echo.
echo.
echo		EXIT THIS SESSION			- ENTER 2
echo.
set/p "cho=>"
if %cho%==1 goto A13
if %cho%==2 goto A14
echo Invalid choice
PAUSE
GOTO A12
:A13
:: The following 2 commands will disable the startup repair screen when power falure occures
bcdedit /set {default} recoveryenabled No
bcdedit /set {default} bootstatuspolicy ignoreallfailures
:: The following commands will remove all unwanted startup programs from boot
del /S /Q "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Startup\"
del /S /Q "%userprofile%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\"
:: The following commands will remove all preftch data
del /S /Q "%windir%\Prefetch\"
:: The following commands will remove all temp data
del /S /Q "%windir%\Temp\"
del /S /Q "%userprofile%\AppData\Local\Temp\"
if %ERRORLEVEL% == 1 GOTO NEXT
if %ERRORLEVEL% == 0 GOTO NEXT
:NEXT
:: The following command will set the windows explorer priority to "realtime"
wmic process where name="explorer.exe" CALL setpriority "realtime"
:: The following commands will disable windows indexing function on Your computer
REG add "HKLM\SYSTEM\CurrentControlSet\Services\WSearch" /v Start /t REG_DWORD /d 4 /f
:: The following commands will disable windows firewall
Netsh advfirewall set allprofiles state off
:: The following command will Force context menus to load faster
REG add "HKEY_CURRENT_USER\Control Panel\Desktop" /v MenuShowDelay /t REG_DWORD /d 256 /f
:: The following commands will Increase the speed of your hard disk by disabling Last Access Update
@echo off
REG QUERY HKLM\SYSTEM\CurrentControlSet\Control\FileSystem\ /V "NTIS Disable Last Access Update" >nul 2>&1
if %ERRORLEVEL% == 1 REG ADD HKLM\SYSTEM\CurrentControlSet\Control\FileSystem /v "NTIS Disable Last Access Update" /t REG_DWORD /d 1 
:: The following command will empty all the recycle bins for all users in Windows
rd /s /q c:\$Recycle.Bin >nul
GOTO L1
:L1
:: The following commands will disable windows auto update facility
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update" /v AUOptions /t REG_DWORD /d 1 /f
:: The following commands will disable windows Defender
@ECHO OFF 
REG QUERY HKLM\SOFTWARE\Policies\Microsoft\ /V "Windows Defender" >nul 2>&1
if %ERRORLEVEL% == 1 REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /V DisableAntiSpyware /t REG_DWORD /d 1 /f 
GOTO E1
:E1
if %ERRORLEVEL% == o REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /V DisableAntiSpyware /t REG_DWORD /d 1 /f
GOTO A14
:A14
cls
echo.
echo.
echo.
echo  # You must reboot your computer for the changes to take effect #
echo.
echo.
echo Choose An Option:
echo.
echo.
echo		RESTART COMPUTER NOW? (Recomented)	 - ENTER 1
echo.
echo.
echo		RESTART COMPUTER LATER !	    	 - ENTER 2
echo.
echo.
set/p "cho=>"
if %cho%==1 goto A15
if %cho%==2 goto END
echo Invalid choice
PAUSE
GOTO A14
:A15
C:\Windows\System32\shutdown -r -t 00
:END
EXIT