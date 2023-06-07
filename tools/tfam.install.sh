#!/bin/sh
set -o errexit
wget https://github.com/Ant0wan/tfam/releases/latest/download/tfam -O /usr/local/bin/tfam
chmod +x /usr/local/bin/tfam
mkdir -p "$HOME/.bashrc.d/"