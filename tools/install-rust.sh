#!/usr/bin/env bash
set -o errexit
set -o errtrace
set -o pipefail

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- --profile complete -y --no-modify-path
pushd "$(git rev-parse --show-toplevel)" || exit 1
cp config/bashrc.d/rust "$HOME"/bashrc.d/rust
popd || exit 1
