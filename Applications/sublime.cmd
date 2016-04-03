@ECHO OFF
TITLE Opening Sublime Text
CLS

IF NOT DEFINED sublime (
  IF EXIST "%ProgramFiles%\Sublime Text 2\sublime_text.exe" ( SETX /M sublime "%ProgramFiles%\Sublime Text 2\sublime_text.exe" )
  IF EXIST "%ProgramFiles%\Sublime Text 3\sublime_text.exe" ( SETX /M sublime "%ProgramFiles%\Sublime Text 3\sublime_text.exe" )
)
IF NOT DEFINED sublime GOTO Error

IF [%1] == [] ( GOTO Standalone ) ELSE ( GOTO WithFile )
GOTO EOF

:Error
  ECHO.
  ECHO  Sublime Text could not be found in the default location...
GOTO EOF

:Standalone
  IF DEFINED NirInstalled (
    nircmd killprocess sublime_text.exe
  ) ELSE (
    taskkill /T /F /IM sublime_text.exe
  )
  START /MAX "Sublime Text" "%sublime%"
  ECHO.
  ECHO  Sublime Text should be running...
GOTO EOF

:WithFile
  IF DEFINED NirInstalled (
    nircmd killprocess sublime_text.exe
  ) ELSE (
    taskkill /T /F /IM sublime_text.exe
  )
  IF NOT EXIST "%~1" ( ECHO.>"%~1" )
  START /MAX "Sublime Text" "%sublime%" "%~1"
  ECHO.
  ECHO  Sublime Text should be running...
  ECHO  Editing "%~1"
GOTO EOF

:EOF
TITLE %COMSPEC%
EXIT /B
