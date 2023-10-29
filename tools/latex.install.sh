#!/bin/sh
if [ -f /etc/fedora-release ]; then
  sudo dnf install -y texlive-scheme-full
elif [ -f /etc/lsb-release ] || [ -f /etc/os-release ] ; then
  sudo apt-get update
  sudo apt-get install -y texlive-latex-base \
	  		  texlive-fonts-recommended \
	                  texlive-fonts-extra \
	                  texlive-latex-extra
else
  echo "Unsupported distribution. This script only supports Fedora and Ubuntu."
  exit 1
fi
echo "LaTex has been successfully installed."
