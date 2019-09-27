#!../../bin/linux-x86_64/consProcServ

## You may have to change consProcServ to something else
## everywhere it appears in this file

< envPaths

cd "${TOP}"

## Register all support components
dbLoadDatabase "dbd/consProcServ.dbd"
consProcServ_registerRecordDeviceDriver pdbbase

drvAsynIPPortConfigure("P0",  "10.128.124.140:20200", 100, 0, 0)
drvAsynIPPortConfigure("P1",  "10.128.124.163:20200", 100, 0, 0)
drvAsynIPPortConfigure("P2",  "10.128.124.164:20200", 100, 0, 0)
drvAsynIPPortConfigure("P3",  "10.128.124.140:20202", 100, 0, 0)
drvAsynIPPortConfigure("P4",  "10.128.124.140:20206", 100, 0, 0)
drvAsynIPPortConfigure("P5",  "10.128.124.140:20208", 100, 0, 0)
drvAsynIPPortConfigure("P6",  "10.128.124.160:20200", 100, 0, 0)
drvAsynIPPortConfigure("P7",  "10.128.124.161:20200", 100, 0, 0)
drvAsynIPPortConfigure("P8",  "10.128.124.162:20200", 100, 0, 0)
drvAsynIPPortConfigure("P9",  "10.128.124.141:20200", 100, 0, 0)
drvAsynIPPortConfigure("P10",  "10.128.124.165:20200", 100, 0, 0)
drvAsynIPPortConfigure("P11",  "10.128.124.166:20200", 100, 0, 0)
drvAsynIPPortConfigure("P12",  "10.128.255.4:21001", 100, 0, 0)
drvAsynIPPortConfigure("P13",  "10.128.255.4:21002", 100, 0, 0)
drvAsynIPPortConfigure("P14",  "10.128.255.4:21008", 100, 0, 0)
drvAsynIPPortConfigure("P15",  "10.128.255.4:21009", 100, 0, 0)
drvAsynIPPortConfigure("P16",  "10.128.255.4:21010", 100, 0, 0)
drvAsynIPPortConfigure("P17",  "10.128.255.4:21003", 100, 0, 0)
drvAsynIPPortConfigure("P18",  "10.128.255.4:21004", 100, 0, 0)
drvAsynIPPortConfigure("P19",  "10.128.255.4:21005", 100, 0, 0)
drvAsynIPPortConfigure("P20",  "10.128.255.4:21006", 100, 0, 0)
drvAsynIPPortConfigure("P21",  "10.128.255.4:21007", 100, 0, 0)
drvAsynIPPortConfigure("P22",  "10.128.255.4:21011", 100, 0, 0)
dbLoadRecords("db/procServControl.db","P=ProcCtrl:BR-RF-DLLRF-01,PORT=P0,SHOWOUT=1,MANUALSTART=,NAME=ProcCtrl:BR-RF-DLLRF-01")
dbLoadRecords("db/procServControl.db","P=ProcCtrl:RA-RaBO01:RF-LLRFCalSys,PORT=P1,SHOWOUT=1,MANUALSTART=,NAME=ProcCtrl:RA-RaBO01:RF-LLRFCalSys")
dbLoadRecords("db/procServControl.db","P=ProcCtrl:RA-RaBO01:RF-LLRFPlDrivers,PORT=P2,SHOWOUT=1,MANUALSTART=,NAME=ProcCtrl:RA-RaBO01:RF-LLRFPlDrivers")
dbLoadRecords("db/procServControl.db","P=ProcCtrl:ILK-Booster,PORT=P3,SHOWOUT=1,MANUALSTART=,NAME=ProcCtrl:ILK-Booster")
dbLoadRecords("db/procServControl.db","P=ProcCtrl:RF-PowerMeter,PORT=P4,SHOWOUT=1,MANUALSTART=,NAME=ProcCtrl:RF-PowerMeter")
dbLoadRecords("db/procServControl.db","P=ProcCtrl:TCU6,PORT=P5,SHOWOUT=1,MANUALSTART=,NAME=ProcCtrl:TCU6")
dbLoadRecords("db/procServControl.db","P=ProcCtrl:ToBO-SSA01,PORT=P6,SHOWOUT=1,MANUALSTART=,NAME=ProcCtrl:ToBO-SSA01")
dbLoadRecords("db/procServControl.db","P=ProcCtrl:ToSI-SSA01,PORT=P7,SHOWOUT=1,MANUALSTART=,NAME=ProcCtrl:ToSI-SSA01")
dbLoadRecords("db/procServControl.db","P=ProcCtrl:ToSI-SSA02,PORT=P8,SHOWOUT=1,MANUALSTART=,NAME=ProcCtrl:ToSI-SSA02")
dbLoadRecords("db/procServControl.db","P=ProcCtrl:SR-RF-DLLRF-01,PORT=P9,SHOWOUT=1,MANUALSTART=,NAME=ProcCtrl:SR-RF-DLLRF-01")
dbLoadRecords("db/procServControl.db","P=ProcCtrl:RA-RaSIA01:RF-LLRFCalSys,PORT=P10,SHOWOUT=1,MANUALSTART=,NAME=ProcCtrl:RA-RaSIA01:RF-LLRFCalSys")
dbLoadRecords("db/procServControl.db","P=ProcCtrl:RA-RaSIA01:RF-CavPlDrivers,PORT=P11,SHOWOUT=1,MANUALSTART=,NAME=ProcCtrl:RA-RaSIA01:RF-CavPlDrivers")
dbLoadRecords("db/procServControl.db","P=ProcCtrl:TB-04:PU-InjSept,PORT=P12,SHOWOUT=1,MANUALSTART=,NAME=ProcCtrl:TB-04:PU-InjSept")
dbLoadRecords("db/procServControl.db","P=ProcCtrl:BO-01D:PU-InjKckr,PORT=P13,SHOWOUT=1,MANUALSTART=,NAME=ProcCtrl:BO-01D:PU-InjKckr")
dbLoadRecords("db/procServControl.db","P=ProcCtrl:BO-48D:PU-EjeKckr,PORT=P14,SHOWOUT=1,MANUALSTART=,NAME=ProcCtrl:BO-48D:PU-EjeKckr")
dbLoadRecords("db/procServControl.db","P=ProcCtrl:TS-01:PU-EjeSeptF,PORT=P15,SHOWOUT=1,MANUALSTART=,NAME=ProcCtrl:TS-01:PU-EjeSeptF")
dbLoadRecords("db/procServControl.db","P=ProcCtrl:TS-01:PU-EjeSeptG,PORT=P16,SHOWOUT=1,MANUALSTART=,NAME=ProcCtrl:TS-01:PU-EjeSeptG")
dbLoadRecords("db/procServControl.db","P=ProcCtrl:TS-04:PU-InjSeptG-1,PORT=P17,SHOWOUT=1,MANUALSTART=,NAME=ProcCtrl:TS-04:PU-InjSeptG-1")
dbLoadRecords("db/procServControl.db","P=ProcCtrl:TS-04:PU-InjSeptG-2,PORT=P18,SHOWOUT=1,MANUALSTART=,NAME=ProcCtrl:TS-04:PU-InjSeptG-2")
dbLoadRecords("db/procServControl.db","P=ProcCtrl:TS-04:PU-InjSeptF,PORT=P19,SHOWOUT=1,MANUALSTART=,NAME=ProcCtrl:TS-04:PU-InjSeptF")
dbLoadRecords("db/procServControl.db","P=ProcCtrl:SI-01SA:PU-InjDpKckr,PORT=P20,SHOWOUT=1,MANUALSTART=,NAME=ProcCtrl:SI-01SA:PU-InjDpKckr")
dbLoadRecords("db/procServControl.db","P=ProcCtrl:SI-01SA:PU-InjNLKckr,PORT=P21,SHOWOUT=1,MANUALSTART=,NAME=ProcCtrl:SI-01SA:PU-InjNLKckr")
dbLoadRecords("db/procServControl.db","P=ProcCtrl:SI-19C4:PU-PingV,PORT=P22,SHOWOUT=1,MANUALSTART=,NAME=ProcCtrl:SI-19C4:PU-PingV")

cd "${TOP}/iocBoot/${IOC}"
iocInit

seq(procServControl,"P=ProcCtrl:BR-RF-DLLRF-01")
seq(procServControl,"P=ProcCtrl:RA-RaBO01:RF-LLRFCalSys")
seq(procServControl,"P=ProcCtrl:RA-RaBO01:RF-LLRFPlDrivers")
seq(procServControl,"P=ProcCtrl:ILK-Booster")
seq(procServControl,"P=ProcCtrl:RF-PowerMeter")
seq(procServControl,"P=ProcCtrl:TCU6")
seq(procServControl,"P=ProcCtrl:ToBO-SSA01")
seq(procServControl,"P=ProcCtrl:ToSI-SSA01")
seq(procServControl,"P=ProcCtrl:ToSI-SSA02")
seq(procServControl,"P=ProcCtrl:SR-RF-DLLRF-01")
seq(procServControl,"P=ProcCtrl:RA-RaSIA01:RF-LLRFCalSys")
seq(procServControl,"P=ProcCtrl:RA-RaSIA01:RF-CavPlDrivers")
seq(procServControl,"P=ProcCtrl:TB-04:PU-InjSept")
seq(procServControl,"P=ProcCtrl:BO-01D:PU-InjKckr")
seq(procServControl,"P=ProcCtrl:BO-48D:PU-EjeKckr")
seq(procServControl,"P=ProcCtrl:TS-01:PU-EjeSeptF")
seq(procServControl,"P=ProcCtrl:TS-01:PU-EjeSeptG")
seq(procServControl,"P=ProcCtrl:TS-04:PU-InjSeptG-1")
seq(procServControl,"P=ProcCtrl:TS-04:PU-InjSeptG-2")
seq(procServControl,"P=ProcCtrl:TS-04:PU-InjSeptF")
seq(procServControl,"P=ProcCtrl:SI-01SA:PU-InjDpKckr")
seq(procServControl,"P=ProcCtrl:SI-01SA:PU-InjNLKckr")
seq(procServControl,"P=ProcCtrl:SI-19C4:PU-PingV")
