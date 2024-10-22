#!/bin/sh
set -o errexit
sudo wget https://github.com/stedolan/jq/releases/latest/download/jq-linux64 -O /usr/local/bin/jq
sudo chmod +x /usr/local/bin/jq
