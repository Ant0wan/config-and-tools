#!/bin/sh
set -o errexit
wget -q -O - https://get.docker.com/ | sh
sudo groupadd docker
sudo usermod -aG docker "$USER"
