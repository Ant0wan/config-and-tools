#!/bin/sh
set -o errexit
VERSION='3.12'
if command -v python; then
	echo "Python already installed."
	exit 0
fi
script_dir=$(dirname "$0")
. "$script_dir/essentials.sh"
curl https://pyenv.run | bash
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
pyenv install $VERSION
pyenv shell $VERSION
#pyenv local $VERSION
pyenv global $VERSION
python -m ensurepip --upgrade
pip install autopep8
pip install pycodestyle
sudo pip config --global set global.require-virtualenv True
pip config debug
echo "Python have been successfully installed."
