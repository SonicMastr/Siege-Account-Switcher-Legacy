@echo off 
ECHO Siege Steam/Uplay Account Switcher
ECHO By SonicMastr
timeout /t 2 >NUL
tasklist /FI "IMAGENAME eq RainbowSix.exe" | find /I "RainbowSix.exe" >NUL
IF ERRORLEVEL 1 GOTO NOSIEGE
GOTO CSIEGE

:NOSIEGE
ECHO.
ECHO Siege is not running. Continue...

:CHECKU
tasklist /FI "IMAGENAME eq upc.exe" | find /I "upc.exe" >NUL
IF ERRORLEVEL 1 GOTO NOUPLAY
GOTO CUPLAY

:NOUPLAY
ECHO.
ECHO Uplay is not running. Continue...

:CHOICE
ECHO.
ECHO Which Account do you want to use?
ECHO.
ECHO 1. Uplay
ECHO 2. Steam
ECHO.
set /p answer=(1 or 2):
IF /I "%answer%" EQU "1" GOTO UPLAY
IF /I "%answer%" EQU "2" GOTO STEAM
ECHO Invalid Answer. Exiting...
exit

:CUPLAY
ECHO.
taskkill /F /IM upc.exe >NUL
ECHO successfully shutdown Uplay. Continue...
GOTO CHOICE

:CSIEGE
ECHO.
taskkill /F /IM RainbowSix.exe >NUL
ECHO successfully shutdown Siege. Continue...
GOTO CHECKU

:UPLAY
ECHO.
ECHO Copying Uplay Version...
xcopy /s /y .\Uplay .\
ECHO "All Done! Siege is now the Uplay Version"
GOTO LAUNCH

:STEAM
ECHO.
ECHO Copying Steam Version...
xcopy /s /y .\Steam .\
ECHO "All Done! Siege is now the Steam Version"
GOTO LAUNCH

:LAUNCH
ECHO.
ECHO Do you want to start Siege Now?
ECHO.
set /p launch=[Y]es or [N]o:
IF /I "%launch%" EQU "Y" START .\RainbowSix.exe
IF /I "%launch%" EQU "y" START .\RainbowSix.exe
IF /I "%launch%" EQU "N" exit
IF /I "%launch%" EQU "n" exit

