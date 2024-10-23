#!/bin/sh
set -o errexit
DIR="$HOME/.git-templates"
mkdir -p "$DIR/hooks"
git config --global init.templatedir "${DIR}"
echo "Copy all hooks for here"
chmod a+x ~/.git-templates/hooks/*
