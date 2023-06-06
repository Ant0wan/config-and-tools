#!/usr/bin/env bash
set -o errexit
curl -sSL https://install.hclq.sh | sh
mkdir -p "$HOME/.bashrc.d/"
pushd "$(git rev-parse --show-toplevel)" || exit 1
cp config/bashrc.d/hclq "$HOME"/.bashrc.d/hclq
popd || exit 1
