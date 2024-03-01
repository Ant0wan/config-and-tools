#!/bin/sh
VERSION=$(curl -s "https://api.github.com/repos/aquasecurity/trivy/releases/latest" | jq -r '.tag_name')
SCRIPTNAME="$(basename "$0")"
BIN="${SCRIPTNAME%.install.sh}"
TMP="/tmp/${BIN}_${LATEST}"
OS="$(uname -s)"
TARGET="trivy_${VERSION:1}_${OS}-64bit.deb"
wget "https://github.com/aquasecurity/trivy/releases/download/${VERSION}/${TARGET}" -O "${TMP}/${TARGET}"
sudo dpkg -i "${TARGET}"
