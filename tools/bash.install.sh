#!/bin/sh
set -o errexit
set -o nounset
githubsource="https://raw.githubusercontent.com/Ant0wan/config-and-tools/main/config/"
if test -e ~/.bashrc; then
	if ! grep -Fxq '	for rc in ~/.bashrc.d/*; do' ~/.bashrc; then
		printf '
# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
	for rc in ~/.bashrc.d/*; do
		if [ -f "$rc" ]; then
			. "$rc"
		fi
	done
fi

unset rc

' >> ~/.bashrc
	fi

else
	if test -e /etc/skel/.bashrc; then
		cp /etc/skel/.bashrc ~
	else
		wget "${githubsource}bashrc" -O "$HOME"/.bashrc
	fi
fi
mkdir -p "$HOME"/.bashrc.d/
