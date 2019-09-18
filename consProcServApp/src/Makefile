TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

#=============================
# Build the IOC application

PROD_IOC = consProcServ
# consProcServ.dbd will be created and installed
DBD += consProcServ.dbd

# consProcServ.dbd will be made up from these files:
consProcServ_DBD += base.dbd

# Include dbd files from all support applications:
consProcServ_DBD += asyn.dbd
consProcServ_DBD += drvAsynIPPort.dbd
consProcServ_DBD += busySupport.dbd
consProcServ_DBD += procServControl.dbd

# Add all the support libraries needed by this IOC
consProcServ_LIBS += procServControl
consProcServ_LIBS += busy
consProcServ_LIBS += seq
consProcServ_LIBS += pv
consProcServ_LIBS += asyn

# consProcServ_registerRecordDeviceDriver.cpp derives from consProcServ.dbd
consProcServ_SRCS += consProcServ_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
consProcServ_SRCS_DEFAULT += consProcServMain.cpp
consProcServ_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#consProcServ_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# Finally link to the EPICS Base libraries
consProcServ_LIBS += $(EPICS_BASE_IOC_LIBS)

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

