#!/bin/sh
if [ -f /etc/fedora-release ]; then
	sudo dnf install -y dnf-plugins-core
	sudo dnf config-manager --add-repo https://rpm.releases.hashicorp.com/fedora/hashicorp.repo
	sudo dnf -y install vagrant
elif [ -f /etc/lsb-release ] || [ -f /etc/os-release ] ; then
	wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
	echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
	sudo apt update && sudo apt install vagrant
else
	echo "Unsupported distribution. This script only supports Fedora and Ubuntu."
	exit 1
fi
echo "Vagrant has been successfully installed."
