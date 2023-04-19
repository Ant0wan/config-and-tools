#!/usr/bin/env bash
set -o errexit
set -o errtrace
set -o pipefail

BINS=('shellcheck' 'hadolint' 'jq' 'fzf')
sudo dnf install ${BINS[@]} -yq
fzf --multi --bind 'right:select-all' --bind 'left:deselect-all' --bind 'space:toggle+down' --marker='x'  --height 40% --layout reverse --info inline --border
