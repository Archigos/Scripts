@ECHO OFF
TITLE Sublime Protocol Parser
MODE CON COLS=50 LINES=3

IF NOT DEFINED sublime (
  IF EXIST "%ProgramFiles%\Sublime Text 3\sublime_text.exe" ( SETX /M sublime="%ProgramFiles%\Sublime Text 3\sublime_text.exe" )
  IF EXIST "%ProgramFiles%\Sublime Text 2\sublime_text.exe" ( SETX /M sublime="%ProgramFiles%\Sublime Text 2\sublime_text.exe" )
)
IF NOT DEFINED sublime GOTO Error

IF DEFINED NirInstalled (
  nircmd killprocess sublime_text.exe
) ELSE (
  taskkill /T /F /IM sublime_text.exe
)
CLS

FOR /F "tokens=1,2,3* delims=/" %%a in ("%~1") DO (
  SET Protocol=%%a
  SET String=%%b
)
FOR /F %%a in ('php -r "ECHO urldecode('%String%');";') DO SET File=%%a

ECHO.
ECHO                Ignore this window
START /MAX "Sublime Text" "%sublime%" "%File%"
GOTO EOF

:Error
  ECHO.
  ECHO  Sublime Text could not be found in the default location...
GOTO EOF

:EOF
EXIT