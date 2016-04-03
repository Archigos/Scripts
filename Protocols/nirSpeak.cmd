@ECHO OFF
TITLE Archigos' NirSpeak
MODE CON COLS=50 LINES=3

ECHO.
ECHO                Ignore this window

FOR /F "tokens=1,2,3* delims=/" %%a in ("%~1") DO (
  SET Protocol=%%a
  SET String=%%b
)
FOR /F "tokens=1* delims=" %%a in ('php -r "ECHO urldecode('%String%');";') DO SET Talk=%%a
say "%Talk%" && EXIT
