#!/bin/sh
set -o errexit
set -o nounset
VESRION=$(curl -s https://api.github.com/repos/vim/vim/git/refs/tags | jq -r '.[].ref' | awk -F'/' '{print $3}' | sort -V | tail -1 | sed 's/^v//')
curl -LO https://github.com/vim/vim/archive/refs/tags/v${VERSION}.tar.gz
tar -xzvf v${VERSION}.tar.gz
cd vim-${VERSION}/
./configure --prefix=/usr/local
make
sudo make install
rm -rf "$HOME"/.vim
git clone git@github.com:Ant0wan/vim-plugin.git "$HOME"/.vim/
