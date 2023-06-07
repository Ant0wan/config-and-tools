#!/bin/sh
set -o errexit
curl -s "https://raw.githubusercontent.com/kubernetes-sigs/kustomize/master/hack/install_kustomize.sh"  | bash
chmod +x kustomize
mv kustomize /usr/local/bin/kustomize