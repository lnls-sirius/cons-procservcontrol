# Author: Cláudio Ferreira Carneiro
# LNLS - Brazilian Synchrotron Light Source Laboratory

FROM  lnlscon/epics-r3.15.8:v1.0
LABEL maintainer="Claudio Carneiro <claudio.carneiro@lnls.br>"

ENV BUSY ${EPICS_MODULES}/busy-R1-7-2
ENV PROCSERVCONTROL ${EPICS_MODULES}/procServControl-1-2
ENV SNCSEQ ${EPICS_MODULES}/seq-2.2.6

# Base procServ port
ENV EPICS_IOC_CAPUTLOG_INET 0.0.0.0
ENV EPICS_IOC_CAPUTLOG_PORT 7012

ENV EPICS_IOC_LOG_INET 0.0.0.0
ENV EPICS_IOC_LOG_PORT 7011

RUN apt-get update && apt-get install -y --no-install-recommends re2c socat && rm -rf /var/lib/apt/lists/*

### Sequencer
RUN cd ${EPICS_MODULES} && wget ${CONS_REPO}/EPICS/seq-2.2.6.tar.gz &&\
    tar -xvzf seq-2.2.6.tar.gz && rm -f seq-2.2.6.tar.gz &&\
    sed -i -e '6cEPICS_BASE='${EPICS_BASE} \
        seq-2.2.6/configure/RELEASE &&\
    cd seq-2.2.6 && make -j 32

### Busy
RUN cd ${EPICS_MODULES} && wget ${CONS_REPO}/EPICS/R1-7-2.tar.gz  && tar -zxvf R1-7-2.tar.gz &&\
    rm -f R1-7-2.tar.gz && cd busy-R1-7-2 &&\
    sed -i\
        -e '7,8s/^/#/'                     \
        -e '11cASYN='${ASYN}               \
        -e '14cAUTOSAVE='${AUTOSAVE}       \
        -e '17cBUSY='${BUSY}               \
        -e '20cEPICS_BASE='${EPICS_BASE}   \
        configure/RELEASE && make -j 32

### procServControl
RUN  cd ${EPICS_MODULES}                               &&\
    wget ${CONS_REPO}/EPICS/procServControl-1-2.tgz    &&\
    tar -zxvf procServControl-1-2.tgz                  &&\
    rm -f procServControl-1-2.tgz                      &&\
    cd procServControl-1-2/                            &&\
    sed -i -e '18s/^/#/' Makefile                      &&\
    sed -i\
        -e '23s/^/#/'                                 \
        -e '26cSNCSEQ='${SNCSEQ}                      \
        -e '27cASYN='${ASYN}                          \
        -e '28cBUSY='${BUSY}                          \
        -e '31cEPICS_BASE='${EPICS_BASE}              \
        configure/RELEASE                             &&\
        make -j 32

RUN mkdir -p /opt/cons-procservcontrol
WORKDIR /opt/cons-procservcontrol

COPY configure       configure
RUN envsubst < configure/RELEASE.tmplt > configure/RELEASE && cat configure/RELEASE

COPY Makefile        Makefile
COPY iocBoot         iocBoot
COPY consProcServApp consProcServApp

RUN make clean; make distclean; make -j 32

ENV PROCSERV_SOCKET "/opt/procServIOC.sock"
COPY bin/entrypoint.sh /opt/entrypoint.sh
CMD ["/bin/bash", "/opt/entrypoint.sh"]