# syntax=docker/dockerfile:1

FROM centos:centos7.8.2003
RUN set -eux && \
    sed -i s/mirror.centos.org/vault.centos.org/g /etc/yum.repos.d/*.repo && \
    sed -i s/^#.*baseurl=http/baseurl=http/g /etc/yum.repos.d/*.repo && \
    sed -i s/^mirrorlist=http/#mirrorlist=http/g /etc/yum.repos.d/*.repo && \ 
    yum install -y \
        git \
        make \
        python3-devel \
        rpm-build && \
    yum clean all && \
    rm -rf /var/cache/yum
WORKDIR /mlnx
