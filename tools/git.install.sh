#!/bin/sh
set -o errexit
VESRION=$(curl -s https://api.github.com/repos/git/git/git/refs/tags | jq -r '.[].ref' | awk -F'/' '{print $3}' | sort -V | tail -1 | sed 's/^v//')
curl -L https://github.com/git/git/archive/v${VERSION}.tar.gz -o git.tar.gz
tar -xzvf git.tar.gz
cd git-*
make prefix=/usr/local all
sudo make prefix=/usr/local install
rm -rf git.tar.gz git-v${VERSION}
githubsource="https://raw.githubusercontent.com/Ant0wan/config-and-tools/main/config/"
wget "${githubsource}gitconfig" -O "$HOME"/.gitconfig
wget "${githubsource}gitignore" -O "$HOME"/.gitignore
if test-z "$BW_SESSION"; then
    BW_SESSION=$(bw login --raw)
    export BW_SESSION
fi
_jq() {
	echo "${key}" | base64 --decode | jq -r "${1}"
}

for key in $(bw get item gpg | jq -r '.fields[] | @base64'); do
	_jq '.value' | base64 --decode >"$(_jq '.name')"
	SIGNING_KEY="${SIGNING_KEY:+$SIGNING_KEY }$(gpg --import "$(_jq '.name')" 2>&1 | head -n 1 | grep -Eo '[0-9A-Z]{16}+')"
	export SIGNING_KEY
	rm "$(_jq '.name')"
done
sed -i "s/{{signing_key}}/${SIGNING_KEY%% *}/g" "$HOME"/.gitconfig