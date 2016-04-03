@ECHO OFF
TITLE Chrome Crashed... Kill it.

ECHO.
IF DEFINED NirInstalled (
  nircmd killprocess chrome.exe
) ELSE (
  taskkill /T /F /IM chrome.exe
)

EXIT