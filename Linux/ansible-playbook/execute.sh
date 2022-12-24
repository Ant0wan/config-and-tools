#!/usr/bin/env bash
# Detect package type
set -x
_package_manager_detect() {
	command -v apt &>/dev/null && pk="apt" && return
	command -v yum &>/dev/null && pk="yum" && return
	_error "No supported package manager installed on system"
	_error "(supported: apt or yum)"
	exit 1
}
_package_manager_detect

# Install Ansible
sudo ${pk} update
sudo ${pk} install ansible

sudo ${pk} install pip
if command -v yum &>/dev/null; then
	sudo yum install python3-devtools python3-devel
fi
pip install psutil
/usr/bin/python3 -m pip install --upgrade pip
#source ~/.bashrc

# Install Ansible modules
ansible-galaxy collection install -r requirements.yml
ansible-playbook main.yml -i inventory --ask-become-pass
