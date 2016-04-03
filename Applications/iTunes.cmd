@ECHO OFF
TITLE Opening iTunes
IF NOT DEFINED iTunes (
  IF EXIST "%ProgramFiles(x86)%\iTunes\iTunes.exe"  ( SET iTunes="%ProgramFiles(x86)%\iTunes\iTunes.exe" )
  IF EXIST "%ProgramFiles%\iTunes\iTunes.exe"       ( SET iTunes="%ProgramFiles%\iTunes\iTunes.exe"      )
)
IF NOT DEFINED iTunes GOTO Error
GOTO Opening

:Error
  ECHO.
  ECHO  iTunes could not be found in the default location
GOTO EOF

:Opening
CLS
ECHO.
ECHO  Warning, this may take a few seconds before you see the window.
START /MAX "iTunes" "%iTunes%"
GOTO EOF

:EOF
EXIT /B