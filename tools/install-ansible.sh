#!/usr/bin/env bash
set -o errexit
set -o errtrace
set -o pipefail

pip install ansible-lint

#pushd "$(git rev-parse --show-toplevel)" || exit 1
#cp config/bashrc.d/ansible "$HOME"/.bashrc.d/ansible
#popd || exit 1

