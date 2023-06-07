#!/bin/sh
set -o errexit
githubsource="https://raw.githubusercontent.com/Ant0wan/config-and-tools/main/config/"
sudo wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/posh-linux-amd64 -O /usr/local/bin/oh-my-posh
sudo chmod +x /usr/local/bin/oh-my-posh
oh-my-posh font install Meslo
oh-my-posh get shell
wget "${githubsource}theme.omp.json" -O "$HOME"/.theme.omp.json
mkdir -p "$HOME"/.bashrc.d/