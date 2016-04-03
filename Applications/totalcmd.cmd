@ECHO OFF
TITLE Opening Total Commander
PUSHD . && CLS
START "Total Commander" "%SYSTEMDRIVE%\totalcmd\totalcmd64.exe"
POPD && CLS
TITLE %COMSPEC% && EXIT /B