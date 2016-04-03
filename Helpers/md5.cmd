@ECHO OFF && SETLOCAL ENABLEEXTENSIONS && SETLOCAL ENABLEDELAYEDEXPANSION
CLS

IF "%~1" == "/?" GOTO Help ELSE GOTO Beginning
IF "%~1" == ""   GOTO Help ELSE GOTO Beginning

:Beginning
ECHO.
ECHO  Input:    %~1
ECHO  ------------------------------------------
PHP -r "ECHO ' MD5 Hash: ' . md5('%~1');"
ECHO.
GOTO EOF

:Help
ECHO.
ECHO  Use "MD5 <PASSWORD>" to genereate the MD5 Hash
GOTO EOF

:EOF
EXIT /B