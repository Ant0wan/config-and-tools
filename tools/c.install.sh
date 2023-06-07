#!/bin/sh
set -o errexit
curl 'https://raw.githubusercontent.com/torvalds/linux/master/.clang-format' -o "$HOME/.clang-format"