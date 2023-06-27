#!/bin/sh
if [ -f /etc/fedora-release ]; then
	sudo dnf install -y openssl
elif [ -f /etc/lsb-release ]; then
	sudo apt-get update
	sudo apt-get install -y openssl
else
	echo "Unsupported distribution. This script only supports Fedora and Ubuntu."
	exit 1
fi
echo "OpenSSL has been successfully installed."

