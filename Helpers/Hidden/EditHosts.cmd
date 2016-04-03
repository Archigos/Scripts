@ECHO OFF
TITLE Editing Windows 'hosts' File
CLS
ECHO.

OPENFILES >NUL || (ECHO. && ECHO  Open an Admin Prompt and try again && GOTO EOF)

PUSHD .
CD /D %SystemRoot%\System32\drivers\etc
START /MAX "host File Editor" Notepad hosts
POPD

:EOF
TITLE %COMSPEC% && EXIT /B