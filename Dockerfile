# Author: Cláudio Ferreira Carneiro
 # LNLS - Brazilian Synchrotron Light Source Laboratory
 
 FROM  lnlscon/epics-r3.15.5:asyn3.35_StreamDevice2.8.8
 LABEL maintainer="Claudio Carneiro <claudio.carneiro@lnls.br>"
 
 ENV CONS_IP 10.128.255.5
 ENV CONS_REPO http://${CONS_IP}:20081/download
 ENV TZ America/Sao_Paulo
 ENV BUSY ${EPICS_MODULES}/busy-R1-7-2
 ENV PROCSERVCONTROL ${EPICS_MODULES}/procServControl-1-2
 ENV SNCSEQ ${EPICS_MODULES}/seq-2.2.6

 ### Sequencer
 RUN apt-get -y install re2c                            &&\
    cd ${EPICS_MODULES}                                 &&\
    wget ${CONS_REPO}/EPICS/seq-2.2.6.tar.gz            &&\
    tar -xvzf seq-2.2.6.tar.gz                          &&\
    rm -f seq-2.2.6.tar.gz                              &&\
    sed -i -e '6cEPICS_BASE=/opt/epics-R3.15.5/base'    \
    seq-2.2.6/configure/RELEASE                         &&\
    cd seq-2.2.6                                        &&\
    make -j 32

 ### Busy
 RUN cd ${EPICS_MODULES}                    &&\
     wget ${CONS_REPO}/EPICS/R1-7-2.tar.gz  &&\
     tar -zxvf R1-7-2.tar.gz                &&\
     rm -f R1-7-2.tar.gz                    &&\
     cd busy-R1-7-2                         &&\
     sed -i\
         -e '7,8s/^/#/'                     \
         -e '11cASYN='${ASYN}               \
         -e '14cAUTOSAVE='${AUTOSAVE}       \
         -e '17cBUSY='${BUSY}               \
         -e '20cEPICS_BASE='${EPICS_BASE}   \
         configure/RELEASE                  &&\
         make -j 32
  
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
   COPY Makefile        Makefile
   COPY iocBoot         iocBoot
   COPY consProcServApp consProcServApp

   RUN make clean; make distclean; make -j 32

   WORKDIR /opt/cons-procservcontrol/iocBoot/iocCONSProcServ
   CMD /usr/local/bin/procServ -L - -f --chdir /opt/cons-procservcontrol/iocBoot/iocCONSProcServ ${PORT} ./st.cmd
