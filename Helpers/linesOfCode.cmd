@ECHO OFF
TITLE Count Total Lines of Code
CLS && ECHO.

PUSHD .
IF NOT "%~1" == "" (
  "%~dp0Hidden\cloc-1.58.exe" "%~1"
)

POPD && TITLE %COMSPEC%