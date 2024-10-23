#!/bin/sh
set -o errexit
VERSION=$(curl -s "https://api.github.com/repos/slimtoolkit/slim/releases/latest" | jq -r '.tag_name')
OS="$(uname -s)"
TARGET="dist_${OS}.tar.gz"
TMP="/tmp/slim"
mkdir -p "$TMP"
curl -sL "https://github.com/slimtoolkit/slim/releases/download/${VERSION}/dist_linux.tar.gz" > "${TMP}/${TARGET}"
sudo tar -zxvf "${TMP}/${TARGET}" -C "$TMP"
sudo mv "$TMP/dist_linux/docker-slim" "$TMP/dist_linux/slim" "$TMP/dist_linux/slim-sensor" /usr/local/bin/
rm -rf "$TMP"
