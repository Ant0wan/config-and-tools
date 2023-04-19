#!/usr/bin/env bash
set -o errexit
set -o errtrace
set -o pipefail

curl -L https://raw.githubusercontent.com/warrensbox/terraform-switcher/release/install.sh | sudo bash

