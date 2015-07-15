FROM ubuntu:14.04

MAINTAINER Justin Cormack <justin@specialbusservice.com>

RUN apt-get update && apt-get install -y \
  binutils \
  cpp \
  curl \
  g++ \
  gcc \
  git \
  libc6-dev \
  cmake \
  build-essential \
  strace \
  gawk \
  libxen-dev \
  xen-utils-common \
  xen-utils \
  qemu-system-x86 \
  gcc-multilib \
  vim \
  file \
  genisoimage \
  make

WORKDIR /usr/src/rumprun

ENV PATH=$PATH:/usr/src/rumprun/app-tools

RUN \
  cd /usr/src && \
  git clone https://github.com/rumpkernel/rumprun.git && \
  cd rumprun && \
  git submodule update --init && \
  ./build-rr.sh hw
