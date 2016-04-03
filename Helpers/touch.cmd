@ECHO OFF
IF NOT "%~1" == "" (
  START /MAX "Sublime Text" sublime "%~1"
)
EXIT /B