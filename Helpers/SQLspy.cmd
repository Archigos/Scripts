@ECHO OFF
TITLE SQLiteSpy v1.9.6
PUSHD .
CLS

IF [%1] == [] GOTO ERROR
IF [%1] == [Base] GOTO Base
IF [%1] == [base] GOTO Base
IF EXIST "%~1" GOTO Open
GOTO EOF

:ERROR
ECHO.
ECHO  You need to include the file to open.
GOTO EOF

:Base
CD %~dp0%
START SQLiteSpy.exe
GOTO EOF

:Open
START SQLiteSpy.exe "%~1"
GOTO EOF

:EOF
POPD && TITLE %COMSPEC%