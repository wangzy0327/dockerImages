FROM arm64v8/ubuntu:18.04
MAINTAINER wzy wangziyang@ncic.ac.cn
ENV DEBIAN_FRONTEND=noninteractive
RUN  apt-get update -y \
     && apt-get install -y deltarpm \
     cmake \
     gcc   \
     make  \
     automake \
     gcc-c++ \
     libgoogle-glog-dev \
     libboost-thread-dev \
     libboost-regex-dev \
     libhdf5-serial-dev \
     liblmdb-dev \
     libleveldb-dev \
     libopencv-dev \
     libopenblas-dev

