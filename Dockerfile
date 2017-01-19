FROM debian:jessie

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update \
    && apt-get install -y wget \
    && wget -O - http://wiki.vyos.net/so3group_maintainers.key | apt-key add - \
    && echo "deb http://ftp.debian.org/debian jessie-backports main" > /etc/apt/sources.list.d/bp.list \
    && echo "deb http://httpredir.debian.org/debian jessie-backports main contrib non-free" > /etc/apt/sources.list.d/bp.list \
    && apt-get update \
    && apt-get -t jessie-backports install -y squashfs-tools \
    && apt-get install -y git autoconf dpkg-dev live-helper syslinux genisoimage make lsb-release fakechroot devscripts

RUN mkdir /build
ADD build.sh /build.sh

WORKDIR /build

ENTRYPOINT ["/build.sh"]
