@ECHO OFF && nircmd setsysvolume 65535

IF "%~1" == "" (
  nircmd speak text "You forgot to include what I'm supposed to say..."
) ELSE (
  nircmd speak text "%~1"
)