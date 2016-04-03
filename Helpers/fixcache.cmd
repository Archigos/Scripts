@ECHO OFF && nircmd setsysvolume 65535

SAY "Fixing the Windows Icon Cache"

PUSHD .
CD /D %LocalAppData%
ATTRIB -H IconCache.db
DEL IconCache.db
POPD

SAY "You should restart the computer when you get a chance."