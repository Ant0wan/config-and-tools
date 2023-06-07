#!/bin/sh
set -o errexit
wget 'https://vault.bitwarden.com/download/?app=cli&platform=linux' -O bw-cli.zip
unzip bw-cli.zip
rm bw-cli.zip
chmod +x bw
sudo mv bw /usr/local/bin/
bw login --apikey
bw logout
