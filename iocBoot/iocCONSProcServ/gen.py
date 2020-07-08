#!/usr/bin/python
import os
import json

header = """#!../../bin/linux-x86_64/consProcServ

## You may have to change consProcServ to something else
## everywhere it appears in this file

< envPaths

cd "${TOP}"

## Register all support components
dbLoadDatabase "dbd/consProcServ.dbd"
consProcServ_registerRecordDeviceDriver pdbbase
asSetFilename("${TOP}/log/Security.as")

"""
init = """
cd "${TOP}/iocBoot/${IOC}"
iocInit
caPutLogInit "10.128.255.4:7012" 2

"""


def load_ioc():
    with open("../../iocs.json", "r") as f:
        iocs = json.load(f)
    return iocs


if __name__ == "__main__":
    data = header
    port = 0
    asynIP = ""
    seq = ""
    db = ""
    for ioc in load_ioc():
        asynIP += 'drvAsynIPPortConfigure("P{0}",  "{1}", 100, 0, 0) # {2}\n'.format(
            port, ioc["ip"], ioc["pv"]
        )
        seq += 'seq(procServControl,"P={0}")\n'.format(ioc["pv"])
        db += 'dbLoadRecords("db/procServControl.db","P={1},PORT=P{0},SHOWOUT=1,MANUALSTART=,NAME={1}")\n'.format(
            port, ioc["pv"]
        )
        port += 1
    data += asynIP
    data += db
    data += init
    data += seq
    with open("st.cmd", "w+") as f:
        f.write(data)

    os.chmod("st.cmd", 0754)
