FROM arm64v8/centos:7
COPY CentOS-Base.repo CentOS-Base.repo 
#RUN mv /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.bak \
#    && mv CentOS-Base.repo /etc/yum.repos.d/
RUN yum clean all \
    && yum makecache \    
    && yum update -y \
    && yum  install -y epel-release \
    curl 
RUN yum install -y python-pip
RUN pip install flask

