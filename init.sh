#!/usr/bin/env bash
set -o errexit
set -o nounset

if ! [ -x "$(command -v jq)" ]; then
	echo "jq is not installed" >&2
	exit 1
fi

githubsource="https://raw.githubusercontent.com/Ant0wan/config-and-tools/master/config/"

sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-"$(rpm -E %fedora)".noarch.rpm -y
sudo dnf update -y
sudo dnf install git vim ffmpeg-libs -y

sudo wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/posh-linux-amd64 -O /usr/local/bin/oh-my-posh
sudo chmod +x /usr/local/bin/oh-my-posh
oh-my-posh font install Meslo
oh-my-posh get shell
wget "${githubsource}theme.omp.json" -O "$HOME"/.theme.omp.json
wget "${githubsource}bashrc" -O "$HOME"/.bashrc
mkdir -p "$HOME"/.bashrc.d/

wget "${githubsource}gitconfig" -O "$HOME"/.gitconfig
wget "${githubsource}gitignore" -O "$HOME"/.gitignore

wget 'https://vault.bitwarden.com/download/?app=cli&platform=linux' -O bw-cli.zip
unzip bw-cli.zip
rm bw-cli.zip
chmod +x bw
sudo mv bw /usr/local/bin/

bw login --apikey
bw logout
BW_SESSION=$(bw login --raw)
export BW_SESSION

_jq() {
	echo "${key}" | base64 --decode | jq -r "${1}"
}
mkdir -p "$HOME"/.ssh
eval "$(ssh-agent -s)"
for key in $(bw get item ssh | jq -r '.fields[] | @base64'); do
	_jq '.value' | base64 --decode >"$HOME"/.ssh/"$(_jq '.name')"
	case "$(_jq '.name')" in
	*".pub")
		chmod 0644 "$HOME"/.ssh/"$(_jq '.name')"
		;;
	*)
		chmod 0600 "$HOME"/.ssh/"$(_jq '.name')"
		ssh-add "$HOME"/.ssh/"$(_jq '.name')"
		;;
	esac
done
sudo systemctl restart sshd

for key in $(bw get item gpg | jq -r '.fields[] | @base64'); do
	_jq '.value' | base64 --decode >"$(_jq '.name')"
	export SIGNING_KEY+=("$(gpg --import "$(_jq '.name')" |& head -n 1 | grep -Eo '[0-9A-Z]{16}+')")
	rm "$(_jq '.name')"
done
sed -i "s/{{signing_key}}/${SIGNING_KEY[0]}/g" "$HOME"/.gitconfig

rm -rf "$HOME"/.vim
git clone git@github.com:Ant0wan/vim-plugin.git "$HOME"/.vim/

reboot
