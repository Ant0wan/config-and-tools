#!/bin/sh
set -o errexit
set -o nounset
wget -qO- https://install.hclq.sh | sh
mkdir -p "$HOME/.bashrc.d/"