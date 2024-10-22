#!/bin/sh
set -o errexit
sudo wget https://github.com/ahmetb/kubectx/releases/latest/download/kubectx -O /usr/local/bin/kubectx
sudo chmod +x /usr/local/bin/kubectx
