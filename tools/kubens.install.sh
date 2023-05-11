#!/bin/sh
set -o errexit
wget https://github.com/ahmetb/kubectx/releases/latest/download/kubens -O /usr/local/bin/kubens
chmod +x /usr/local/bin/kubens
