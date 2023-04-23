#!/usr/bin/env bash
set -o errexit
set -o errtrace
set -o pipefail

curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install --bin-dir /usr/local/bin --install-dir /usr/local/aws-cli --update
rm awscliv2.zip

#command -v pip 2>/dev/null && pip install aws-shell

#pushd "$(git rev-parse --show-toplevel)" || exit 1
#cp config/bashrc.d/aws "$HOME"/.bashrc.d/aws
#popd || exit 1

