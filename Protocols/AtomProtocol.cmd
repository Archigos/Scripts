@ECHO OFF
TITLE Atom Protocol Parser
MODE CON COLS=50 LINES=3

IF NOT DEFINED atom (
  IF EXIST "%LocalAppData%\atom\app-1.4.0\atom.exe"         ( SETX /M atom "%LocalAppData%\atom\app-1.4.0\atom.exe" )
)
IF NOT DEFINED atom GOTO Error

IF DEFINED NirInstalled (
  REM nircmd killprocess atom.exe
) ELSE (
  REM taskkill /T /F /IM atom.exe
)
CLS

FOR /F "tokens=1,2,3* delims=/" %%a in ("%~1") DO (
  SET Protocol=%%a
  SET String=%%b
)
FOR /F %%a in ('php -r "ECHO urldecode('%String%');";') DO SET File=%%a

ECHO.
ECHO                Ignore this window
START /MAX "Atom" "%atom%" "%File%"
GOTO EOF

:Error
  ECHO.
  ECHO  Atom could not be found in the default location... (Only version 1.4.0 was checked)
GOTO EOF

:EOF
EXIT /B