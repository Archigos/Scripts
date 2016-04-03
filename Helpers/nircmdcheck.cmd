@ECHO OFF && SETLOCAL ENABLEEXTENSIONS && SETLOCAL ENABLEDELAYEDEXPANSION
TITLE NirCmd Tests

IF "%~1" == "/?" GOTO Help
IF "%~1" == ""   GOTO Beginning

:Help
ECHO.
ECHO  This file checks if NirCmd is available on the system and prompts you to
ECHO  download it if it can not be found.
ECHO  File can be found here: http://www.nirsoft.net/utils/nircmd.html
GOTO EOF

:Beginning
SET NirCmdAvailable=
SET NirCmdDownload=

nircmd speak text "" >NUL 2>&1
IF ERRORLEVEL 1 (
  SET NirCmdAvailable=No
  ECHO.
  ECHO  Some of my batch files rely on NirCmd being installed.
  SET /P NirCmdDownload="Do you want to download it now? "
) ELSE (
  IF DEFINED NirInstalled (
    nircmd speak text "It appears NirCmd is both found and accessible. Congrats."
    GOTO EOF
  ) ELSE (
    SETX /M NirInstalled True
    nircmd speak text "You must restart the command prompt before the scripts will recognize NirCmd."
    GOTO EOF
  )
)

IF /I "%NirCmdDownload%" == "Y" GOTO ConfirmYes
IF /I "%NirCmdDownload%" == "N" GOTO ConfirmNo
GOTO ConfirmUnknown

:ConfirmYes
START "NirCmd" "http://www.nirsoft.net/utils/nircmd.html"
CLS
ECHO.
ECHO  Please Copy/Move NirCmd.exe to your default Windows directory
ECHO  Or just run it from your download location and click the button to copy it.
ECHO.
ECHO  Afterwards, run this check again.
GOTO EOF

:ConfirmNo
CLS
ECHO.
ECHO  I'm sorry you decided not to download this freeware app that is required for
ECHO  some of my scripts. You'll be missing out on some features, but I'll try to allow
ECHO  as much as possible to work without it. If you reconsider, please run this check
ECHO  again and select [Y]es instead of [N]o.
GOTO EOF

:ConfirmUnknown
CLS
ECHO.
ECHO  Um, you are supposed to either press Y for Yes or N for No... Please try again.
GOTO Beginning

:EOF
EXIT /B