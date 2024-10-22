#!/bin/sh
if [ -f /etc/fedora-release ]; then
  sudo dnf install -y \
    curl \
    bzip2-devel \
    libffi-devel \
    xz-devel \
    ncurses-devel \
    readline-devel \
    sqlite-devel \
    openssl-devel \
    libxml2-devel \
    xmlsec1-devel \
    llvm \
    make \
    openssl \
    tk-devel \
    wget \
    zlib-devel
elif [ -f /etc/lsb-release ] || [ -f /etc/os-release ] ; then
  sudo apt-get update
  sudo apt-get install -y \
    build-essential \
    curl \
    libbz2-dev \
    libffi-dev \
    liblzma-dev \
    libncursesw5-dev \
    libreadline-dev \
    libsqlite3-dev \
    libssl-dev \
    libxml2-dev \
    libxmlsec1-dev \
    llvm \
    make \
    openssl \
    tk-dev \
    wget \
    xz-utils \
    zlib1g-dev
else
  echo "Unsupported distribution. This script only supports Fedora and Ubuntu."
  exit 1
fi
echo "Required packages have been successfully installed."
