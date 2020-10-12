#!/bin/sh

# Start the database for the PAS instance.

DBPORT=8898
export DBPORT

if [ "${DLC}" = "" ] ; then
    DLC="@DLC@"
    export DLC
fi

if [ "${DBDIR}" = "" ] ; then
    DBDIR="${CATALINA_BASE}/work"
    export DBDIR
fi

${DLC}/bin/_proutil ${DBDIR}/sports2000.db -C holder
retcode=$? # this saves the return code
case $retcode in
0) echo "Starting database healthmon on port ${DBPORT}"
${DLC}/bin/_mprosrv ${DBDIR}/sports2000.db -H localhost -S ${DBPORT} -n 20 # -cpinternal utf-8 -cpstream utf-8 &>/dev/null &
;;
14) echo "The database is in single-user mode"
exit $retcode
;;
16) echo "The database is busy in multi-user mode"
exit $retcode
;;
*) echo "proutil -C holder failed"
echo error code = $retcode
exit $retcode
;;
esac # case $retcode in

