# cons-procservcontrol
This repository is responsible for the procServControl applications of various IOCs that are not containerized, mostly related to the RF subsystem.

## Build & Configuration
Before building a new image, update the `st.cmd` file:
```
cd iocBoot/iocCONSProcServ/
./gen.py
```
Some useful environment variables:
|Env|Default|Desc|
|---|---|---|
|EPICS_IOC_CAPUTLOG_INET|0.0.0.0|EPICS Logging Inet (generic)|
|EPICS_IOC_CAPUTLOG_PORT|7012|EPICS Logging Port (generic)|
|EPICS_IOC_LOG_INET|0.0.0.0|EPICS Logging Inet (caput)|
|EPICS_IOC_LOG_PORT|7011|EPICS Logging Port (caput)|

In order to access this IOC shell:
```bash
   socat - UNIX-CLIENT:${PROCSERV_SOCKET}
```

## Docker
[Dockerhub Image](https://hub.docker.com/r/lnlscon/procservcontrol)

