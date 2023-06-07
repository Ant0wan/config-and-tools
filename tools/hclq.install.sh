#!/bin/sh
set -o errexit
wget -qO- https://install.hclq.sh | sh
mkdir -p "$HOME/.bashrc.d/"