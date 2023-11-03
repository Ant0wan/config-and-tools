#!/bin/sh
set -o errexit
VERSION=$(curl -s "https://api.github.com/repos/google/go-containerregistry/releases/latest" | jq -r '.tag_name')
ARCH="$(uname -m)"
OS="$(uname -s)"
TMP="/tmp/go-containerregistry"
mkdir -p "$TMP"
curl -sL "https://github.com/google/go-containerregistry/releases/download/${VERSION}/go-containerregistry_${OS}_${ARCH}.tar.gz" > "${TMP}/${TARGET}"
tar -zxvf "${TMP}/${TARGET}" -C /usr/local/bin/ crane
