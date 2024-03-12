#!/bin/sh
set -o errexit
#curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash
SCRIPTNAME="$(basename "$0")"
BIN="${SCRIPTNAME%.install.sh}"
VERSION=$(curl -s "https://api.github.com/repos/${BIN}/${BIN}/releases/latest" | jq -r '.tag_name')
OS="$(uname -s | awk '{print tolower($0)}')"
ARCH="$(uname -m | sed 's/x86_64/amd64/')"
TMP="/tmp/${BIN}_${VERSION}"
wget "https://get.helm.sh/${BIN}-${VERSION}-${OS}-${ARCH}.tar.gz" -O ${TMP}
