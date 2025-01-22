#!/bin/sh
set -o errexit
DIR="$HOME/.git-templates"
mkdir -p "$DIR/hooks"
git config --global init.templatedir "${DIR}"
printf "Copy all hooks for here\n"
sudo chmod --recursive a+x ~/.git-templates/hooks
