#!/bin/sh
set -o errexit
set -o nounset
VESRION=$(curl -s https://api.github.com/repos/git/git/git/refs/tags | jq -r '.[].ref' | awk -F'/' '{print $3}' | sort -V | tail -1 | sed 's/^v//')
curl -L https://github.com/git/git/archive/v${VERSION}.tar.gz -o git.tar.gz
tar -xzvf git.tar.gz
cd git-*
make prefix=/usr/local all
sudo make prefix=/usr/local install
rm -rf git.tar.gz git-v${VERSION}
githubsource="https://raw.githubusercontent.com/Ant0wan/config-and-tools/main/config/"
wget "${githubsource}gitconfig" -O "$HOME"/.gitconfig
wget "${githubsource}gitignore" -O "$HOME"/.gitignore
