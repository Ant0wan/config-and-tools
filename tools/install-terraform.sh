#!/usr/bin/env bash
set -o errexit
set -o errtrace
set -o pipefail

VERSION='1.4.5'
BIN="terraform_${VERSION}_linux_amd64.zip"

curl "https://releases.hashicorp.com/terraform/$VERSION/$BIN" -o "$BIN"
unzip "$BIN"
sudo install terraform /usr/local/bin/
rm -rf "$BIN" terraform

touch "$HOME/.bashrc"
mkdir -p "$HOME/.bashrc.d/"
terraform -install-autocomplete
pushd "$(git rev-parse --show-toplevel)" || exit 1
cp config/bashrc.d/terraform "$HOME"/.bashrc.d/terraform
popd || exit 1

