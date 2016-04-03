@ECHO OFF
CLS
::CALL SAY "Fixing Microsoft Office 2016 Trial Expiration"

:: Creating Required Dates
SET TrialDate=11/15/2015
FOR /F "tokens=1* delims= " %%a IN ('date /T') DO SET CurrentDate=%%b

:: Displaying Information
ECHO.
ECHO  Setting System Date to Trial Date
DATE %TrialDate%
ECHO  Done...
ECHO.
ECHO  Notifying next step:
CALL SAY "Open any required Office Application before Date resets and Trial Expires"
CALL SAY "Once your application opens, CANCEL the Activation Window, then press any key in this window."
ECHO  Done...
TIMEOUT /T 160
ECHO  Resetting Date
w32tm /resync /nowait
CALL SAY "Date Reset to normal!"
EXIT && CLS
