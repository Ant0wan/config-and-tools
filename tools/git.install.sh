#!/bin/sh

# Check if the script is running as root
if [ "$(id -u)" -ne 0 ]; then
  echo "Please run this script as root."
  exit 1
fi

# Check if the distribution is Fedora or Ubuntu
if [ -f /etc/fedora-release ]; then
  # Install git on Fedora
  dnf install -y git
elif [ -f /etc/lsb-release ]; then
  # Install git on Ubuntu
  apt-get update
  apt-get install -y git
else
  echo "Unsupported distribution. This script only supports Fedora and Ubuntu."
  exit 1
fi
echo "Git has been successfully installed."
