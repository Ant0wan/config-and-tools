#!/usr/bin/env bash
set -o errexit
set -o errtrace
set -o pipefail

VERSION='0.16.0'

curl -sSLo ./terraform-docs.tar.gz "https://terraform-docs.io/dl/v${VERISON}/terraform-docs-v${VERSION}-$(uname)-amd64.tar.gz"
tar -xzf terraform-docs.tar.gz
sudo install terraform-docs /usr/local/bin/
rm terraform-docs terraform-docs.tar.gz

mkdir -p "$HOME/.bashrc.d/"
pushd "$(git rev-parse --show-toplevel)" || exit 1
cp config/bashrc.d/terraform-docs "$HOME"/.bashrc.d/terraform-docs
popd || exit 1

