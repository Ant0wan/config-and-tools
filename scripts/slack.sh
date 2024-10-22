#!/bin/sh
BASEURL="https://downloads.slack-edge.com/releases/linux/4.36.140/prod/x64/"
if [ -f /etc/fedora-release ]; then
	BIN="slack-4.36.140-0.1.el8.x86_64.rpm"
	wget "${BASEURL}${BIN}" -O "/tmp/${BIN}"
	sudo dnf install -y "/tmp/${BIN}"
elif [ -f /etc/lsb-release ] || [ -f /etc/os-release ] ; then
	BIN="slack-desktop-4.36.140-amd64.deb"
	wget "${BASEURL}${BIN}" -O "/tmp/${BIN}"
	sudo apt-get install -y "/tmp/${BIN}"
else
	echo "Unsupported distribution. This script only supports Fedora and Ubuntu."
	exit 1
fi
echo "Slack have been successfully installed."
