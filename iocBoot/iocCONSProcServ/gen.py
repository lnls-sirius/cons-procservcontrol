#!/usr/bin/python
import os

header = '''#!../../bin/linux-x86_64/consProcServ

## You may have to change consProcServ to something else
## everywhere it appears in this file

< envPaths

cd "${TOP}"

## Register all support components
dbLoadDatabase "dbd/consProcServ.dbd"
consProcServ_registerRecordDeviceDriver pdbbase

'''
init = '''
cd "${TOP}/iocBoot/${IOC}"
iocInit

'''
iocs = [
    {"pv":"ProcCtrl:BR-RF-DLLRF-01"                     ,"ip":"10.128.124.140:20200"},
    {"pv":"ProcCtrl:ILK-Booster"                        ,"ip":"10.128.124.140:20202"},
    {"pv":"ProcCtrl:RF-PowerMeter"                      ,"ip":"10.128.124.140:20206"},
    {"pv":"ProcCtrl:TCU6"                               ,"ip":"10.128.124.140:20208"},
    {"pv":"ProcCtrl:SR-RF-DLLRF-01"                     ,"ip":"10.128.128.141:20200"},
    {"pv":"ProcCtrl:ToBO-SSA01"                         ,"ip":"10.128.124.160:20200"},
    {"pv":"ProcCtrl:ToSI-SSA01"                         ,"ip":"10.128.124.161:20200"},
    {"pv":"ProcCtrl:ToSI-SSA02"                         ,"ip":"10.128.124.162:20200"},
    {"pv":"ProcCtrl:RA-RaBO01:RF-LLRFCalSys"            ,"ip":"10.128.124.163:20200"},
    {"pv":"ProcCtrl:RA-RaBO01:RF-LLRFPlDrivers"         ,"ip":"10.128.124.164:20200"},
    {"pv":"ProcCtrl:RA-RaSIA01:RF-LLRFCalSys"           ,"ip":"10.128.124.165:20200"},
    {"pv":"ProcCtrl:RA-RaSIA01:RF-CavPlDrivers"         ,"ip":"10.128.124.166:20200"},

    {"pv":"ProcCtrl:TB-04:PU-InjSept"                   ,"ip":"10.128.255.4:21001"},
    {"pv":"ProcCtrl:BO-01D:PU-InjKckr"                  ,"ip":"10.128.255.4:21002"},
    {"pv":"ProcCtrl:TS-04:PU-InjSeptG-1"                ,"ip":"10.128.255.4:21003"},
    {"pv":"ProcCtrl:TS-04:PU-InjSeptG-2"                ,"ip":"10.128.255.4:21004"},
    {"pv":"ProcCtrl:TS-04:PU-InjSeptF"                  ,"ip":"10.128.255.4:21005"},
    {"pv":"ProcCtrl:SI-01SA:PU-InjDpKckr"               ,"ip":"10.128.255.4:21006"},
    {"pv":"ProcCtrl:SI-01SA:PU-InjNLKckr"               ,"ip":"10.128.255.4:21007"},
    {"pv":"ProcCtrl:BO-48D:PU-EjeKckr"                  ,"ip":"10.128.255.4:21008"},
    {"pv":"ProcCtrl:TS-01:PU-EjeSeptF"                  ,"ip":"10.128.255.4:21009"},
    {"pv":"ProcCtrl:TS-01:PU-EjeSeptG"                  ,"ip":"10.128.255.4:21010"},
    {"pv":"ProcCtrl:SI-19C4:PU-PingV"                   ,"ip":"10.128.255.4:21011"},

    {"pv":"ProcCtrl:Reg-Dip"                   ,"ip":"10.128.255.58:20200"},
    {"pv":"ProcCtrl:Reg-Qua"                   ,"ip":"10.128.255.59:20200"},
    {"pv":"ProcCtrl:Reg-Sex"                   ,"ip":"10.128.255.60:20200"},
]

if __name__ == '__main__':
    data = header
    port = 0
    asynIP = ''
    seq = ''
    db = ''
    for ioc in iocs:
        asynIP += 'drvAsynIPPortConfigure("P{0}",  "{1}", 100, 0, 0)\n'.format(port, ioc['ip'])
        seq += 'seq(procServControl,"P={0}")\n'.format(ioc['pv'])
        db += 'dbLoadRecords("db/procServControl.db","P={1},PORT=P{0},SHOWOUT=1,MANUALSTART=,NAME={1}")\n'.format(port, ioc['pv'])
        port += 1
    data += asynIP
    data += db
    data += init
    data += seq
    with open('st.cmd', 'w+') as f:
        f.write(data)

    os.chmod('st.cmd', 0754)
