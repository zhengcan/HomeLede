FROM ubuntu:bionic

RUN echo > /etc/apt/sources.list && \
  echo "deb http://mirrors.cloud.tencent.com/ubuntu/ bionic main restricted universe multiverse" >> /etc/apt/sources.list && \
  echo "deb http://mirrors.cloud.tencent.com/ubuntu/ bionic-security main restricted universe multiverse" >> /etc/apt/sources.list &&  \
  echo "deb http://mirrors.cloud.tencent.com/ubuntu/ bionic-updates main restricted universe multiverse" >> /etc/apt/sources.list &&  \
  echo "deb-src http://mirrors.cloud.tencent.com/ubuntu/ bionic main restricted universe multiverse" >> /etc/apt/sources.list &&  \
  echo "deb-src http://mirrors.cloud.tencent.com/ubuntu/ bionic-security main restricted universe multiverse" >> /etc/apt/sources.list &&  \
  echo "deb-src http://mirrors.cloud.tencent.com/ubuntu/ bionic-updates main restricted universe multiverse" >> /etc/apt/sources.list

RUN apt-get update && apt-get upgrade
RUN DEBIAN_FRONTEND="noninteractive" apt-get -y install build-essential asciidoc binutils bzip2 gawk gettext git libncurses5-dev libz-dev patch python3.5 python2.7 unzip zlib1g-dev lib32gcc1 libc6-dev-i386 subversion flex uglifyjs git-core gcc-multilib p7zip p7zip-full msmtp libssl-dev texinfo libglib2.0-dev xmlto qemu-utils upx libelf-dev autoconf automake libtool autopoint device-tree-compiler g++-multilib antlr3 gperf wget curl rsync

RUN adduser user
USER user
WORKDIR /home/user

RUN git clone -b k5 https://github.com/zhengcan/HomeLede/ && \
  cd HomeLede && \
  ./prepareCompile.sh && \
  make download V=s

