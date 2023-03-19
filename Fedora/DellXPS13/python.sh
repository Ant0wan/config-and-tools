#!/usr/bin/env bash
set -x
sudo dnf install -y python2 python3 pip
python3 -m pip install --upgrade pip
python3 -m pip install virtualenvwrapper
mkdir -p "$HOME/.virtualenv"
grep -a "export WORKON_HOME=$HOME/.virtualenvs" "$HOME/.$(basename "$SHELL")rc" || printf "export WORKON_HOME=%s/.virtualenvs\n" "$HOME" >> "$HOME/.$(basename "$SHELL")rc"
export WORKON_HOME=$HOME/.virtualenvs
local pathvirt
pathvirt="$(which virtualenvwrapper.sh)"
grep -a "source $pathvirt" "$HOME/.$(basename "$SHELL")rc" || printf "source %s\n" "$pathvirt" >> "$HOME/.$(basename "$SHELL")rc"
. "$pathvirt"
python3 -m pip config set global.require-virtualenv True
python3 -m pip config --site set global.index-url "https://pypi.org/simple"
