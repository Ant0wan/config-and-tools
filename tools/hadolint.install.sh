#!/bin/sh
set -o errexit
sudo wget https://github.com/hadolint/hadolint/releases/latest/download/hadolint-Linux-x86_64  -O /usr/local/bin/hadolint
sudo chmod +x /usr/local/bin/hadolint
