#!/bin/sh
set -o errexit
REPO="controlplaneio/kubesec"
VERSION=$(curl -s "https://api.github.com/repos/${REPO}/releases/latest" | jq -r '.tag_name')
ARCH="$(uname -m | sed 's/x86_64/amd64/')"
OS="$(uname -s | tr '[:upper:]' '[:lower:]')"
TARGET="kubesec_${OS}_${ARCH}.tar.gz"
TMP="/tmp/kubesec"
mkdir -p "$TMP"
curl -sL "https://github.com/${REPO}/releases/download/${VERSION}/${TARGET}" -o "${TMP}/${TARGET}"
sudo tar -zxvf "${TMP}/${TARGET}" -C /usr/local/bin/ kubesec
rm -rf "$TMP"
