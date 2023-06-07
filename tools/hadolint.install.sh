#!/bin/sh
set -o errexit
wget https://github.com/hadolint/hadolint/releases/latest/download/hadolint-Linux-x86_64  -O /usr/local/bin/hadolint
chmod +x /usr/local/bin/hadolint