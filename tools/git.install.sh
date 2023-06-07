#!/bin/sh
set -o errexit
githubsource="https://raw.githubusercontent.com/Ant0wan/config-and-tools/main/config/"
wget "${githubsource}gitconfig" -O "$HOME"/.gitconfig
wget "${githubsource}gitignore" -O "$HOME"/.gitignore
