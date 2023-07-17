#!/bin/sh
if [ -f /etc/fedora-release ]; then
  sudo dnf install -y git
elif [ -f /etc/lsb-release ] || [ -f /etc/os-release ] ; then
  sudo apt-get update
  sudo apt-get install -y git
else
  echo "Unsupported distribution. This script only supports Fedora and Ubuntu."
  exit 1
fi
echo "Git has been successfully installed."
