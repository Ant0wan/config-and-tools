#!/bin/sh
set -o errexit
set -o nounset
curl 'https://raw.githubusercontent.com/torvalds/linux/master/.clang-format' -o "$HOME/.clang-format"