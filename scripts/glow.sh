#!/bin/sh
if [ -f /etc/fedora-release ]; then
	echo '[charm]
	name=Charm
	baseurl=https://repo.charm.sh/yum/
	enabled=1
	gpgcheck=1
	gpgkey=https://repo.charm.sh/yum/gpg.key' | sudo tee /etc/yum.repos.d/charm.repo
	sudo yum install glow
elif [ -f /etc/lsb-release ] || [ -f /etc/os-release ] ; then
	sudo mkdir -p /etc/apt/keyrings
	curl -fsSL https://repo.charm.sh/apt/gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/charm.gpg
	echo "deb [signed-by=/etc/apt/keyrings/charm.gpg] https://repo.charm.sh/apt/ * *" | sudo tee /etc/apt/sources.list.d/charm.list
	sudo apt update && sudo apt install glow
else
  echo "Unsupported distribution. This script only supports Fedora and Ubuntu."
  exit 1
fi
echo "Glow has been successfully installed."
