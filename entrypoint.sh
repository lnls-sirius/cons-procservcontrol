#!/bin/bash
echo "#################################################################################"
echo "# CONS ProcSercControl - Port ${PROCSERV_SOCKET}"
echo "#     In order to access this IOC shell: \"socat - UNIX-CLIENT:${PROCSERV_SOCKET}\""
echo "#################################################################################"

/usr/local/bin/procServ -L - -f -n "CONS-PROC-IOC" -c /opt/cons-procservcontrol/iocBoot/iocCONSProcServ -i ^D^C unix:${PROCSERV_SOCKET} ./st.cmd
