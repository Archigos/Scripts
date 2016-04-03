@ECHO OFF && SETLOCAL ENABLEDELAYEDEXPANSION
SET /A Executed = 0
SET /A Run = 1

IF [%1] == [] (
  SET /A Total = 1
) ELSE (
  SET /A Total = %~1
)
SET /A TempPercent=100/%Total%
CALL ProgressBar %TempPercent% && CLS

:Beginning
ECHO.
ECHO  Calculating Directory Structure
ECHO  Making Pass %Run% of %Total%
ECHO.
for /f "delims=" %%d in ('dir /s /b /ad ^| sort /R') do @rd "%%~d"
SET /A Executed += 1
SET /A Run += 1
SET /A Percent=(100*%Run%)/%Total%

IF %Executed% == %Total% GOTO Done
CALL progressbar.cmd %Percent% && CLS
GOTO Beginning

:Done
TITLE %COMSPEC% && CLS
ECHO.
ECHO  Complete
EXIT /B