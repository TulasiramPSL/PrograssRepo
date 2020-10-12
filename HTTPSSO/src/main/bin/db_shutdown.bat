@echo off

rem Stop the database for the PAS instance.

if not defined DLC (
    set DLC=@DLC@
)

if not defined DBDIR (
    set DBDIR=%CATALINA_BASE%/work
)

%DLC%/bin/_mprshut %DBDIR%/sports2000.db -by

exit /b 0
