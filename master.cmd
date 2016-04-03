@ECHO OFF
CHCP 65001
SETLOCAL ENABLEEXTENSIONS && SETLOCAL ENABLEDELAYEDEXPANSION

:: Version History
  SET vers=1.0-beta   && REM Initial Framework
  SET vers=1.025-beta && REM Added a bit more skeleton
  SET vers=2.0        && REM Initially Added to GitHub

  SET version=Version: %vers%
  TITLE Archigos Interface %version%
  MODE CON COLS=89 LINES=44 && COLOR 0F
  PUSHD . && CLS

:: Figure out date and time
  FOR /F "tokens=*" %%A IN ('DATE /T') DO (
    FOR %%B IN (%%A) DO (
      SET Today=%%B
    )
  )
  FOR /F %%A IN ('TIME /T') DO (
    SET Now=%%A
  )

:: Initial Redirect
  IF "%~1" == "/?" GOTO HelpMe
  GOTO Begin

:HelpMe
CLS
ECHO.
ECHO  This displays a useful list of most of the scripts in this package. Some scripts are
ECHO  hidden for either security purposes or are 'helpers' for other scripts that are
ECHO  useless standalone.
ECHO.
ECHO  Please run %~NX0% again without '/?' to view menu system.
GOTO EOF

:Begin
  @SET Master=3
  @SET Applications=0
  @SET Locations=0

  FOR /F "tokens=1,2,* delims=." %%F IN ('DIR /B %~dp0*.cmd') DO SET /A Master+=1
  FOR /F "tokens=1,2,* delims=." %%F IN ('DIR /B %~dp0Applications\*.cmd') DO SET /A Applications+=1
  FOR /F "tokens=1,2,* delims=." %%F IN ('DIR /B %~dp0Locations\*.cmd') DO SET /A Locations+=1
  @SET /A Total = Master + Applications + Locations

ECHO.
ECHO  ╔══╗ %Today%                                                                   %Now%
ECHO  ╚╬ ╚══════════════════════════════════════════════════════════════════════════════════╗
ECHO   ║    ____     ______       ____   __    __    _____      _____      ____      _____  ║
ECHO   ║   (    )   (   __ \     / ___) (  \  /  )  (_   _)    / ___ \    / __ \    / ____\ ║
ECHO   ║   / /\ \    ) (__) )   / /      \ (__) /     │ │     / /   \_)  / /  \ \  ( (___   ║
ECHO   ║  ( (__) )  (    __/   ( (        ) __ (      │ │    ( (  ____  ( ()  () )  \___ \  ║
ECHO   ║   )    (    ) \ \     ( (       ( (  ) )     │ │    ( ( (__  ) ( ()  () )      ) ) ║
ECHO   ║  /  /\  \  ( ( \ \_))  \ \___    ) )( (     _│ │_    \ \__/ /   \ \__/ /   ___/ /  ║
ECHO   ║ /__(  )__\  )_) \__/    \____)  /_/  \_\   (_____)    \____/     \____/   /____/   ║
ECHO   ╠═══════════════════════════════════════════════╦════════════════════════════════════╣
ECHO   ║┌──┬──┐┌─────┐┌────── ───┬───┌──────┌────┐     ║ Master                             ║
ECHO   ║│  │  ││_____│└─────┐    │   ├──────│____│  %Master%  ║ EditHosts*                         ║
ECHO   ║│  │  ││     │──────┘    │   └──────│  └┐      ║ EditPath*                          ║
ECHO   ╠══════════════════╦════════════════════════════╣ FixOffice                          ║
ECHO   ║ Applications  %Applications%  ║                            ║        *Requires Admin Priviledges ║
ECHO   ╠══════════════════╝                            ╚════════════════════════════════════╝
FOR /F "tokens=1,2,* delims=." %%F IN ('DIR /B %~dp0Applications\*.cmd') DO ECHO   ║ %%F
ECHO   ╠═══════════════╗
ECHO   ║ Locations  %Locations%  ║
ECHO   ╠═══════════════╝
FOR /F "tokens=1,2,* delims=." %%F IN ('DIR /B %~dp0Locations\*.cmd') DO ECHO   ║ %%F
ECHO   ╠════════════╗
ECHO   ║ Total  %Total%  ║
ECHO   ╠════════════╝
ECHO   ║ Upcoming (or just not counted):
ECHO   ║   Web ^& HTPC Related Ease-of-use
ECHO  ╔╬╗
ECHO  ╚═╝

:EOF
POPD
