FROM arm64v8/ubuntu:18.04
COPY sources.list sources.list
RUN mv /etc/apt/sources.list /etc/apt/sources.list.bak \
    && mv sources.list /etc/apt/
RUN apt-get update -y\
    && apt-get install -y python2.7 \
    python-pip \
    curl 
RUN pip install flask
