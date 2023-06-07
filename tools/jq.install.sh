#!/bin/sh
set -o errexit
wget https://github.com/stedolan/jq/releases/latest/download/jq-linux64 -O /usr/local/bin/jq
chmod +x /usr/local/bin/jq