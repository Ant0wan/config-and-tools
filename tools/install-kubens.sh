#!/usr/bin/env bash
set -o errexit
set -o errtrace
set -o pipefail

wget https://github.com/ahmetb/kubectx/releases/latest/download/kubens -O /usr/local/bin/kubens
chmod +x /usr/local/bin/kubens
