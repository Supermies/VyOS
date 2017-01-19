FROM debian:squeeze

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update \
    && apt-get install -y wget \
    && wget -O - http://packages.vyos.net/vyos-pubkey.gpg  | apt-key add - \
    && echo "deb http://backports.debian.org/debian-backports squeeze-backports main" > /etc/apt/sources.list.d/bp.list \
    && apt-get update \
    && apt-get -t squeeze-backports install -y squashfs-tools \
    && apt-get install -y git autoconf dpkg-dev live-helper syslinux genisoimage make lsb-release fakechroot devscripts

RUN mkdir /build
ADD build.sh /build.sh

WORKDIR /build

ENTRYPOINT ["/build.sh"]
