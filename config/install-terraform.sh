#!/usr/bin/env bash

sudo dnf install -y dnf-plugins-core
sudo dnf config-manager --add-repo https://rpm.releases.hashicorp.com/fedora/hashicorp.repo
sudo dnf -y install terraform

touch ~/.bashrc
sudo mv /usr/bin/terraform /usr/local/bin/terraform
terraform -install-autocomplete

