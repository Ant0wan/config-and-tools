#!/usr/bin/env bash
set -o errexit
set -o errtrace
set -o pipefail

curl https://pyenv.run | bash
. "$HOME/.$(basename "$SHELL")rc"

#sudo apt update
#sudo apt install \
#    build-essential \
#    curl \
#    libbz2-dev \
#    libffi-dev \
#    liblzma-dev \
#    libncursesw5-dev \
#    libreadline-dev \
#    libsqlite3-dev \
#    libssl-dev \
#    libxml2-dev \
#    libxmlsec1-dev \
#    llvm \
#    make \
#    tk-dev \
#    wget \
#    xz-utils \
#    zlib1g-dev

pyenv install 3.11
pyenv shell 3.11
pyenv local 3.11
pyenv global 3.11

python -m ensurepip --upgrade
pip config --global set global.require-virtualenv True
pip config debug
