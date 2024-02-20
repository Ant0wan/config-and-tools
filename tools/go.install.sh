#!/bin/sh
set -o errexit
#script_dir=$(dirname "$0")
#. "$script_dir/git.install.sh"
	#rm -rf /usr/local/go
	#VERSIONS=$(git ls-remote --tags https://go.googlesource.com/go | awk -F '/' '{print $3}')
#VERSION='go1.22.0'


wget https://go.dev/dl/go1.22.0.linux-amd64.tar.gz -O /tmp/
wget https://go.dev/dl/go1.22.0.linux-amd64.tar.gz -O /tmp/
#tar -C /usr/local -xzf go1.22.0.linux-amd64.tar.gz

ARCH="$(uname -m | sed 's/x86_64/amd64/')"
OS="$(uname -s)"
TARGET="tofu_${LATEST}_${OS}_${ARCH}.zip"
TMP="/tmp/tofu_${LATEST}"
mkdir -p "$TMP"
sudo wget "https://github.com/opentofu/opentofu/releases/latest/download/tofu_${LATEST}_${OS}_${ARCH}.zip" -O "${TMP}/${TARGET}"
sudo unzip "${TMP}/${TARGET}" tofu -d /usr/local/bin/
sudo chmod +x /usr/local/bin/tofu
