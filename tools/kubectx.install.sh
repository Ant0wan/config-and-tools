#!/bin/sh
set -o errexit
wget https://github.com/ahmetb/kubectx/releases/latest/download/kubectx -O /usr/local/bin/kubectx
chmod +x /usr/local/bin/kubectx