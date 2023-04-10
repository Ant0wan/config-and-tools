#!/usr/bin/env bash
set -o errexit
set -o errtrace
set -o pipefail

BINS=('shellcheck' 'hadolint' 'jq')
sudo dnf install ${BINS[@]} -y
