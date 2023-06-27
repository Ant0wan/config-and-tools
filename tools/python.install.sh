#!/bin/sh
script_dir=$(dirname "$0")
. "$script_dir/essentials.install.sh"
curl https://pyenv.run | bash
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
pyenv install 3.11
pyenv shell 3.11
#pyenv local 3.11
pyenv global 3.11
python -m ensurepip --upgrade
pip install autopep8
pip install pycodestyle
#pip config --global set global.require-virtualenv True
pip config debug
echo "Python have been successfully installed."
