@ECHO OFF && SETLOCAL ENABLEEXTENSIONS && SETLOCAL ENABLEDELAYEDEXPANSION
TITLE %COMSPEC% && MODE CON COLS=200 LINES=68 && COLOR 07
PUSHD . && CLS

:: Test for Admin (Uncomment if you require them)
REM OPENFILES >NUL || ECHO Administrative Privileges Required

IF "%~1" == "/?" GOTO Help ELSE GOTO Beginning
IF "%~1" == "" GOTO Help

:Beginning
FOR %%? IN ("%~1") DO (
  ECHO.
  ECHO  File Name Only       : %%~n?
  ECHO  File Extension       : %%~x?
  ECHO  Name in 8.3 notation : %%~sn?
  ECHO  File Attributes      : %%~a?
  ECHO  Located on Drive     : %%~d?
  ECHO  File Size            : %%~z?
  ECHO  Last-Modified Date   : %%~t?
  ECHO  Parent Folder        : %%~dp?
  ECHO  Fully Qualified Path : %%~f?
  ECHO  FQP in 8.3 notation  : %%~sf?
  ECHO  Location in the PATH : %%~dp$PATH:?
)
GOTO EOF

:Help
ECHO.
ECHO  You need to include the file name to be checked:
ECHO    Example: checkfile index.php
GOTO EOF

:EOF
POPD