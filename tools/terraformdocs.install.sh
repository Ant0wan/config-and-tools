#!/bin/sh
set -o errexit
set -o nounset
VERSION='0.16.0'
curl -sSLo ./terraform-docs.tar.gz "https://terraform-docs.io/dl/v${VERSION}/terraform-docs-v${VERSION}-$(uname)-amd64.tar.gz"
tar -xzf terraform-docs.tar.gz
sudo install terraform-docs /usr/local/bin/
rm terraform-docs terraform-docs.tar.gz LICENSE README.md
mkdir -p "$HOME/.bashrc.d/"