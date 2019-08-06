# set the base image
FROM ubuntu:18.04

# author
MAINTAINER RET https://github.com/rocmsys/RET

# OS Package Management Systems
ENV PMS="apt-get"

# extra metadata
LABEL description="Dockerfile used by RET to build ROCm Container."

# update sources list
RUN $PMS update -qy

# install basic packages
RUN $PMS install -qy git

# cleanup
RUN $PMS -qy autoremove

# add rocm path to environment
ENV PATH="${PATH}:/opt/rocm/bin:/opt/rocm/profiler/bin:/opt/rocm/opencl/bin/x86_64"
ENV TERM dumb

# install ROCm with RET
RUN mkdir /home/ret \
    && git clone https://github.com/rocmsys/ret.git /home/ret \
    && cd /home/ret \
    && ./ret install tensorflow -ic

