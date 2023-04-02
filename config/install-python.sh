#!/usr/bin/env bash
set -o errexit
set -o errtrace
set -o pipefail

curl https://pyenv.run | bash
. "$HOME/.$(basename "$SHELL")rc"
pyenv install 3.11
pyenv shell 3.11
pyenv local 3.11
pyenv global 3.11

#python -m ensurepip --upgrade
#pip config --global set global.require-virtualenv True
#pip config debug
