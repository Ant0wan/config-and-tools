#!/usr/bin/env bash
set -o errexit
set -o errtrace
set -o pipefail

VERSION='1.13.2'
BIN="vault_${VERSION}_linux_amd64.zip"

curl "https://releases.hashicorp.com/vault/$VERSION/$BIN" -o "$BIN"
unzip "$BIN"
sudo install vault /usr/local/bin/
rm -rf "$BIN" vault

