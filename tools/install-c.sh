#!/usr/bin/env bash
set -o errexit
set -o errtrace
set -o pipefail

curl 'https://raw.githubusercontent.com/torvalds/linux/master/.clang-format' -o "$HOME/.clang-format"
