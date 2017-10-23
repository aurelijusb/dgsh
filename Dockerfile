FROM ubuntu:17.10

MAINTAINER Aurelijus Banelis <aurelijus@banelis.lt>

# All dependencies
RUN apt-get update
RUN apt-get install -y make automake gcc libtool pkg-config texinfo help2man autopoint bison check gperf git xz-utils gettext
RUN apt-get install -y wbritish wamerican libfftw3-dev csh curl bzip2
RUN apt-get install -y rsync

# Getting source
RUN cd /home && git clone --recursive https://github.com/dspinellis/dgsh.git && cd dgsh
WORKDIR /home/dgsh

# Compiling
ENV FORCE_UNSAFE_CONFIGURE=1
RUN make config
RUN make
RUN make install

# Easy for debugging
CMD /bin/bash