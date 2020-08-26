#!/bin/bash
echo "#####################################################"
echo "# CONS ProcSercControl - Port ${PROCSERV_IOC_PORT}"
echo "#####################################################"
/usr/local/bin/procServ -L - -f -n "CONS-PROC-IOC" -c /opt/cons-procservcontrol/iocBoot/iocCONSProcServ -i ^D^C ${PROCSERV_IOC_PORT} ./st.cmd