#!/bin/sh
set -o errexit
set -o nounset
VERSION='1.10.0'
BIN="terraform_${VERSION}_linux_amd64.zip"
curl "https://releases.hashicorp.com/terraform/$VERSION/$BIN" -o "$BIN"
unzip "$BIN"
sudo install terraform /usr/local/bin/
rm -rf "$BIN" terraform
mkdir -p "$HOME/.terraform.d/plugin-cache"
mkdir -p "$HOME/.bashrc.d/"
