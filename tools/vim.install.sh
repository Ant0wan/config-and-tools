#!/bin/sh
set -o errexit
set -o nounset
VERSION="8.2"
curl -O https://ftp.nluug.nl/pub/vim/unix/vim-${VERSION}.tar.gz
tar -xzvf vim-${VERSION}.tar.gz
rm -rf "$HOME"/.vim
git clone git@github.com:Ant0wan/vim-plugin.git "$HOME"/.vim/
