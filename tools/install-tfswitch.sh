#!/usr/bin/env bash
set -o errexit
set -o errtrace
set -o pipefail

curl -L https://raw.githubusercontent.com/warrensbox/terraform-switcher/release/install.sh | sudo bash

mkdir -p "$HOME/.bashrc.d/"
pushd "$(git rev-parse --show-toplevel)" || exit 1
cp config/bashrc.d/terraform "$HOME"/.bashrc.d/terraform
popd || exit 1

