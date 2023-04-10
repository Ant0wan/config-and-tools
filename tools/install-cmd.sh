#!/usr/bin/env bash
set -o errexit
set -o errtrace
set -o pipefail

BINS=('shellcheck' 'hadolint' 'jq' 'fzf')
sudo dnf install ${BINS[@]} -yq
