#!/usr/bin/env bash
set -o errexit
VERSION='1.4.5'
BIN="terraform_${VERSION}_linux_amd64.zip"
curl "https://releases.hashicorp.com/terraform/$VERSION/$BIN" -o "$BIN"
unzip "$BIN"
sudo install terraform /usr/local/bin/
rm -rf "$BIN" terraform
mkdir -p "$HOME/.terraform.d/plugin-cache"
mkdir -p "$HOME/.bashrc.d/"
pushd "$(git rev-parse --show-toplevel)" || exit 1
cp config/bashrc.d/terraform "$HOME"/.bashrc.d/terraform
popd || exit 1
