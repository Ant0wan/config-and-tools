#!/usr/bin/env bash
set -o errexit
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install --bin-dir /usr/local/bin --install-dir /usr/local/aws-cli --update
rm -rf awscliv2.zip aws/
pushd "$(git rev-parse --show-toplevel)" || exit 1
cp config/bashrc.d/aws "$HOME"/.bashrc.d/aws
popd || exit 1
