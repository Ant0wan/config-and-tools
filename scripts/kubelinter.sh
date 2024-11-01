#!/bin/sh
set -o errexit
mkdir -p /tmp/kube-linter
LATEST_VERSION=$(curl -s "https://api.github.com/repos/stackrox/kube-linter/releases/latest" | grep -Po '"tag_name": "\K(.*)(?=")')
curl -L "https://github.com/stackrox/kube-linter/releases/download/$LATEST_VERSION/kube-linter-linux.tar.gz" -o "/tmp/kube-linter/kube-linter.tar.gz"
tar -xzf "/tmp/kube-linter/kube-linter.tar.gz" -C "/tmp/kube-linter"
sudo mv "/tmp/kube-linter/kube-linter" "/usr/local/bin/kube-linter"
sudo chmod +x "/usr/local/bin/kube-linter"
rm -rf /tmp/kube-linter
kube-linter version
