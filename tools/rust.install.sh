#!/bin/sh
set -o errexit
script_dir=$(dirname "$0")
. "$script_dir/essentials.install.sh"
. "$script_dir/c.install.sh"
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- --profile complete -y --no-modify-path
source "$HOME/.cargo/env"
"$(which cargo)" install cargo-watch
"$(which cargo)" install cargo-audit
