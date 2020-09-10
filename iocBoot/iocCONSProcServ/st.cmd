#!../../bin/linux-x86_64/consProcServ

< envPaths

epicsEnvSet("EPICS_IOC_LOG_INET", "$(EPICS_IOC_LOG_INET)")
epicsEnvSet("EPICS_IOC_LOG_PORT", "$(EPICS_IOC_LOG_PORT)")

cd "${TOP}"

dbLoadDatabase "dbd/consProcServ.dbd"
consProcServ_registerRecordDeviceDriver pdbbase
asSetFilename("${TOP}/db/Security.as")

drvAsynIPPortConfigure("P0",  "10.128.124.140:20200", 100, 0, 0) # ProcCtrl:BR-RF-DLLRF-01
drvAsynIPPortConfigure("P1",  "10.128.124.140:20202", 100, 0, 0) # ProcCtrl:ILK-Booster
drvAsynIPPortConfigure("P2",  "10.128.124.140:20206", 100, 0, 0) # ProcCtrl:RF-PowerMeter
drvAsynIPPortConfigure("P3",  "10.128.124.140:20208", 100, 0, 0) # ProcCtrl:TCU6
drvAsynIPPortConfigure("P4",  "10.128.124.140:20210", 100, 0, 0) # ProcCtrl:P7WaterCalc
drvAsynIPPortConfigure("P5",  "10.128.124.140:20212", 100, 0, 0) # ProcCtrl:RF-Gen
drvAsynIPPortConfigure("P6",  "10.128.124.163:20200", 100, 0, 0) # ProcCtrl:RA-RaBO01:RF-LLRFCalSys
drvAsynIPPortConfigure("P7",  "10.128.124.164:20200", 100, 0, 0) # ProcCtrl:RA-RaBO01:RF-LLRFPlDrivers
drvAsynIPPortConfigure("P8",  "10.128.124.160:20200", 100, 0, 0) # ProcCtrl:ToBO-SSA01
drvAsynIPPortConfigure("P9",  "10.128.124.141:20202", 100, 0, 0) # ProcCtrl:ILK-SR1
drvAsynIPPortConfigure("P10",  "10.128.124.141:20200", 100, 0, 0) # ProcCtrl:SR-RF-DLLRF-01
drvAsynIPPortConfigure("P11",  "10.128.124.161:20200", 100, 0, 0) # ProcCtrl:ToSI-SSA01
drvAsynIPPortConfigure("P12",  "10.128.124.162:20200", 100, 0, 0) # ProcCtrl:ToSI-SSA02
drvAsynIPPortConfigure("P13",  "10.128.124.165:20200", 100, 0, 0) # ProcCtrl:RA-RaSIA01:RF-LLRFCalSys
drvAsynIPPortConfigure("P14",  "10.128.124.166:20200", 100, 0, 0) # ProcCtrl:RA-RaSIA01:RF-CavPlDrivers

dbLoadRecords("db/procServControl.db","P=ProcCtrl:BR-RF-DLLRF-01,PORT=P0,SHOWOUT=1,MANUALSTART=,NAME=ProcCtrl:BR-RF-DLLRF-01")
dbLoadRecords("db/procServControl.db","P=ProcCtrl:ILK-Booster,PORT=P1,SHOWOUT=1,MANUALSTART=,NAME=ProcCtrl:ILK-Booster")
dbLoadRecords("db/procServControl.db","P=ProcCtrl:RF-PowerMeter,PORT=P2,SHOWOUT=1,MANUALSTART=,NAME=ProcCtrl:RF-PowerMeter")
dbLoadRecords("db/procServControl.db","P=ProcCtrl:TCU6,PORT=P3,SHOWOUT=1,MANUALSTART=,NAME=ProcCtrl:TCU6")
dbLoadRecords("db/procServControl.db","P=ProcCtrl:P7WaterCalc,PORT=P4,SHOWOUT=1,MANUALSTART=,NAME=ProcCtrl:P7WaterCalc")
dbLoadRecords("db/procServControl.db","P=ProcCtrl:RF-Gen,PORT=P5,SHOWOUT=1,MANUALSTART=,NAME=ProcCtrl:RF-Gen")
dbLoadRecords("db/procServControl.db","P=ProcCtrl:RA-RaBO01:RF-LLRFCalSys,PORT=P6,SHOWOUT=1,MANUALSTART=,NAME=ProcCtrl:RA-RaBO01:RF-LLRFCalSys")
dbLoadRecords("db/procServControl.db","P=ProcCtrl:RA-RaBO01:RF-LLRFPlDrivers,PORT=P7,SHOWOUT=1,MANUALSTART=,NAME=ProcCtrl:RA-RaBO01:RF-LLRFPlDrivers")
dbLoadRecords("db/procServControl.db","P=ProcCtrl:ToBO-SSA01,PORT=P8,SHOWOUT=1,MANUALSTART=,NAME=ProcCtrl:ToBO-SSA01")
dbLoadRecords("db/procServControl.db","P=ProcCtrl:ILK-SR1,PORT=P9,SHOWOUT=1,MANUALSTART=,NAME=ProcCtrl:ILK-SR1")
dbLoadRecords("db/procServControl.db","P=ProcCtrl:SR-RF-DLLRF-01,PORT=P10,SHOWOUT=1,MANUALSTART=,NAME=ProcCtrl:SR-RF-DLLRF-01")
dbLoadRecords("db/procServControl.db","P=ProcCtrl:ToSI-SSA01,PORT=P11,SHOWOUT=1,MANUALSTART=,NAME=ProcCtrl:ToSI-SSA01")
dbLoadRecords("db/procServControl.db","P=ProcCtrl:ToSI-SSA02,PORT=P12,SHOWOUT=1,MANUALSTART=,NAME=ProcCtrl:ToSI-SSA02")
dbLoadRecords("db/procServControl.db","P=ProcCtrl:RA-RaSIA01:RF-LLRFCalSys,PORT=P13,SHOWOUT=1,MANUALSTART=,NAME=ProcCtrl:RA-RaSIA01:RF-LLRFCalSys")
dbLoadRecords("db/procServControl.db","P=ProcCtrl:RA-RaSIA01:RF-CavPlDrivers,PORT=P14,SHOWOUT=1,MANUALSTART=,NAME=ProcCtrl:RA-RaSIA01:RF-CavPlDrivers")

cd "${TOP}/iocBoot/${IOC}"
iocInit
iocLogInit
caPutLogInit "$(EPICS_IOC_CAPUTLOG_INET):$(EPICS_IOC_CAPUTLOG_PORT)" 2

seq(procServControl,"P=ProcCtrl:BR-RF-DLLRF-01")
seq(procServControl,"P=ProcCtrl:ILK-Booster")
seq(procServControl,"P=ProcCtrl:RF-PowerMeter")
seq(procServControl,"P=ProcCtrl:TCU6")
seq(procServControl,"P=ProcCtrl:P7WaterCalc")
seq(procServControl,"P=ProcCtrl:RF-Gen")
seq(procServControl,"P=ProcCtrl:RA-RaBO01:RF-LLRFCalSys")
seq(procServControl,"P=ProcCtrl:RA-RaBO01:RF-LLRFPlDrivers")
seq(procServControl,"P=ProcCtrl:ToBO-SSA01")
seq(procServControl,"P=ProcCtrl:ILK-SR1")
seq(procServControl,"P=ProcCtrl:SR-RF-DLLRF-01")
seq(procServControl,"P=ProcCtrl:ToSI-SSA01")
seq(procServControl,"P=ProcCtrl:ToSI-SSA02")
seq(procServControl,"P=ProcCtrl:RA-RaSIA01:RF-LLRFCalSys")
seq(procServControl,"P=ProcCtrl:RA-RaSIA01:RF-CavPlDrivers")
