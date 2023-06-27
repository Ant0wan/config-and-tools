#!/bin/sh
set -o errexit
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- --profile complete -y --no-modify-path
source "$HOME/.cargo/env"
"$(which cargo)" install cargo-watch cargo-audit
