#!/bin/sh

# Stop the database for the PAS instance.

if [ "${DLC}" = "" ] ; then
    DLC="@DLC@"
    export DLC
fi

if [ "${DBDIR}" = "" ] ; then
    DBDIR="${CATALINA_BASE}/work"
    export DBDIR
fi

${DLC}/bin/_mprshut ${DBDIR}/test1.db -by &>/dev/null &

