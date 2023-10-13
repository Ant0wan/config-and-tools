#!/bin/sh
set -o errexit
LATEST="$(curl -s "https://api.github.com/repos/mrtazz/checkmake/releases/latest" | jq .tag_name -r)"
ARCH="$(uname -m | sed 's/x86_64/amd64/')"
OS="$(uname -s)"
sudo wget https://github.com/mrtazz/checkmake/releases/latest/download/checkmake-${LATEST}.${OS,,}.${ARCH,,} -O /usr/local/bin/checkmake
sudo chmod +x /usr/local/bin/checkmake
