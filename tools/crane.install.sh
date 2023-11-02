#!/bin/sh
set -o errexit
VERSION=$(curl -s "https://api.github.com/repos/google/go-containerregistry/releases/latest" | jq -r '.tag_name')
ARCH="$(uname -m)"
OS="$(uname -s)"
TARGET="go-containerregistry.tar.gz"
TMP="/tmp/go-containerregistry"
mkdir -p "$TMP"
curl -sL "https://github.com/google/go-containerregistry/releases/download/${VERSION}/go-containerregistry_${OS}_${ARCH}.tar.gz" > "${TMP}/${TARGET}"
curl -sL "https://github.com/google/go-containerregistry/releases/download/${VERSION}/multiple.intoto.jsonl" > "${TMP}/provenance.intoto.jsonl"
slsa-verifier-linux-amd64 verify-artifact "${TMP}/${TARGET}" --provenance-path "${TMP}/provenance.intoto.jsonl" --source-uri github.com/google/go-containerregistry --source-tag "${VERSION}"
tar -zxvf "${TMP}/${TARGET}" -C /usr/local/bin/ crane
