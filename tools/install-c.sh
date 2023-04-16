#!/usr/bin/env bash
set -o errexit
set -o errtrace
set -o pipefail

curl 'https://raw.githubusercontent.com/torvalds/linux/master/.clang-format' -o "$HOME/.clang-format"
pushd "$(git rev-parse --show-toplevel)" || exit 1
cp config/bashrc.d/c "$HOME"/.bashrc.d/c
popd || exit 1
