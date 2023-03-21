#!/usr/bin/env bash
set -o errexit
set -o errtrace
set -o pipefail

which dnf 2>/dev/null && sudo dnf install -y tk-devel readline-devel sqlite-devel
which apt 2>/dev/null && sudo apt install -y tk-dev readline-dev sqlite-dev

curl https://pyenv.run | bash
printf '
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
' >> "$HOME/.$(basename "$SHELL")rc"
source "$HOME/.$(basename "$SHELL")rc"
pyenv install 2.7
pyenv install 3.11
pyenv shell 3.11
pyenv local 3.11
pyenv global 3.11

python -m ensurepip --upgrade
pip config --global set global.require-virtualenv True
pip config debug
