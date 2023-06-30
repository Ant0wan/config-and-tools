#!/bin/sh
set -o errexit
curl -s "https://raw.githubusercontent.com/kubernetes-sigs/kustomize/master/hack/install_kustomize.sh"  | sudo bash
sudo chmod +x kustomize
sudo mv kustomize /usr/local/bin/kustomize
