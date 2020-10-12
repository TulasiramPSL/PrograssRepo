@echo off

rem Start the database for the PAS instance.

set DBPORT=8898

if not defined DLC (
    set DLC=@DLC@
)

if not defined DBDIR (
    set DBDIR=%CATALINA_BASE%/work
)

rem Check if the database is/isn't already started.
%DLC%/bin/_proutil %DBDIR%/sports2000.db -C holder
if errorlevel 0 goto notinuse
goto end

:notinuse
rem Use of "start /min" is the only way to execute the database startup without blocking the rest of the PAS startup!
rem @start /min %DLC%/bin/_mprosrv %DBDIR%/test1.db -H localhost -S %DBPORT% -n 20 -cpinternal utf-8 -cpstream utf-8
@start /min %DLC%/bin/_mprosrv %DBDIR%/sports2000.db -H localhost -S %DBPORT% -n 20
goto end

:end

exit /b 0
