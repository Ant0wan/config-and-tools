#!/bin/sh
set -o errexit
if [ -f /etc/fedora-release ]; then
  sudo dnf install -y python-bugzilla-cli
elif [ -f /etc/lsb-release ] || [ -f /etc/os-release ] ; then
  sudo apt-get update
  sudo apt-get install -y bugzilla-cli
else
  echo "Unsupported distribution. This script only supports RHEL and Debian-based OS."
  exit 1
fi
echo "Bugzilla CLI has been successfully installed."
