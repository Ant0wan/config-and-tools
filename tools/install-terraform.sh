#!/usr/bin/env bash

sudo dnf install -y dnf-plugins-core
sudo dnf config-manager --add-repo https://rpm.releases.hashicorp.com/fedora/hashicorp.repo
sudo dnf -y install terraform

touch ~/.bashrc
sudo mv /usr/bin/terraform /usr/local/bin/terraform
terraform -install-autocomplete

pushd "$(git rev-parse --show-toplevel)" || exit 1
cp config/bashrc.d/terraform "$HOME"/.bashrc.d/terraform
popd || exit 1

