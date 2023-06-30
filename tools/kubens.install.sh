#!/bin/sh
set -o errexit
sudo wget https://github.com/ahmetb/kubectx/releases/latest/download/kubens -O /usr/local/bin/kubens
sudo chmod +x /usr/local/bin/kubens
