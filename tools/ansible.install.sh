#!/bin/sh
set -o errexit
script_dir=$(dirname "$0")
. "$script_dir/python.install.sh"
pip install ansible-lint
