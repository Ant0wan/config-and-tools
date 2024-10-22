#!/bin/sh
set -o errexit
LATEST="$(curl -s "https://api.github.com/repos/opentofu/opentofu/releases/latest" | jq .tag_name -r | sed 's/^v//g')"
ARCH="$(uname -m | sed 's/x86_64/amd64/')"
OS="$(uname -s)"
TARGET="tofu_${LATEST}_${OS}_${ARCH}.zip"
TMP="/tmp/tofu_${LATEST}"
mkdir -p "$TMP"
sudo wget "https://github.com/opentofu/opentofu/releases/latest/download/tofu_${LATEST}_${OS}_${ARCH}.zip" -O "${TMP}/${TARGET}"
sudo unzip "${TMP}/${TARGET}" tofu -d /usr/local/bin/
sudo chmod +x /usr/local/bin/tofu
