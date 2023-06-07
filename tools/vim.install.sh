#!/bin/sh
set -o errexit
set -o nounset
VERSION="v8.2.3451"
curl -LO https://github.com/vim/vim/archive/refs/tags/${VERSION}.tar.gz
tar -xzvf ${VERSION}.tar.gz
cd ${VERSION}/
./configure --prefix=/usr/local
make
sudo make install
rm -rf "$HOME"/.vim
git clone git@github.com:Ant0wan/vim-plugin.git "$HOME"/.vim/
