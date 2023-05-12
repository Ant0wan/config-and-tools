#!/usr/bin/env bash
set -o errexit
wget https://github.com/Ant0wan/tfam/releases/latest/download/tfam -O /usr/local/bin/tfam
chmod +x /usr/local/bin/tfam
mkdir -p "$HOME/.bashrc.d/"
pushd "$(git rev-parse --show-toplevel)" || exit 1
cp config/bashrc.d/tfam "$HOME"/.bashrc.d/tfam
popd || exit 1
