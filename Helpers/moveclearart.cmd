@ECHO OFF
CLS

IF NOT EXIST "C:\Photoshop Temp\Output\clearart.png" (
  ECHO.
  ECHO  You need to create a Clearart via Photoshop first.
  ECHO  Exiting...
  GOTO EOF
) ELSE (
  ECHO.
  ECHO  Found a Clearart file
  IF NOT EXIST ".\clearart.png" (
    MOVE "C:\Photoshop Temp\Output\clearart.png" ".\clearart.png"
  )
  GOTO EOF
)

:EOF
EXIT /B