#!/usr/bin/env bash
set -o errexit
set -o errtrace
set -o pipefail

wget https://github.com/mikefarah/yq/releases/latest/download/yq_linux_amd64 -O /usr/local/bin/yq
chmod +x /usr/local/bin/yq
