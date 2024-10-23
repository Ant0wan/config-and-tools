#!/bin/sh
set -o errexit
VERSION=$(curl -s "https://api.github.com/repos/wagoodman/dive/releases/latest" | jq -r '.tag_name' | sed 's/^v//')
ARCH="$(uname -m)"
OS="$(uname -s | tr '[:upper:]' '[:lower:]')"
case "$ARCH" in
  "x86_64")
    ARCH="amd64"
    ;;
  "aarch64")
    ARCH="arm64"
    ;;
  *)
    echo "Unsupported architecture: $ARCH"
    exit 1
    ;;
esac
TARGET="dive_${VERSION}_${OS}_${ARCH}.tar.gz"
TMP="/tmp/dive"
mkdir -p "$TMP"
curl -sL "https://github.com/wagoodman/dive/releases/download/v${VERSION}/${TARGET}" > "${TMP}/${TARGET}"
tar -zxvf "${TMP}/${TARGET}" -C "$TMP" > /dev/null 2>&1
sudo mv "$TMP/dive" /usr/local/bin/
rm -rf "$TMP"
