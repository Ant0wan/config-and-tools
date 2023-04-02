#!/usr/bin/env bash
set -o errexit
set -o errtrace
set -o pipefail

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
