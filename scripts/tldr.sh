#!/bin/sh
PACKAGES="tldr"
if [ -f /etc/fedora-release ]; then
  sudo dnf install -y "${PACKAGES}"
elif [ -f /etc/lsb-release ] || [ -f /etc/os-release ] ; then
  sudo apt-get update
  sudo apt-get install -y "${PACKAGES}"
else
  echo "Unsupported distribution. This script only supports Fedora and Ubuntu."
  exit 1
fi
echo "${PACKAGES} has been successfully installed."
