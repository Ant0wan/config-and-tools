#!/bin/sh
set -o errexit
_getrepo() {
	download_path=$(mktemp -d -t tfam.XXXXXXXXXX)
	cd "$download_path"
	wget https://github.com/Ant0wan/config-and-tools/archive/refs/heads/main.zip
	unzip main.zip
	cd "${download_path}/config-and-tools-main"
}
_delrepo() {
	rm -rf "${download_path}"
}

_prompt() {
	wget -q -O -  https://raw.githubusercontent.com/lotabout/skim/master/install | sh
	info=$(curl https://api.github.com/repos/sharkdp/bat/releases/latest | jq .tag_name,.id -r)
	tag=$(echo $info | awk -F ' ' '{ print $1 }')
	id=$(echo $info | awk -F ' ' '{ print $2 }')
	pkgs=$(curl https://api.github.com/repos/sharkdp/bat/releases/${id}/assets | jq .[].name -r)
	kernel=$(uname -s | awk '{print tolower($0)}')
	arch=$(uname -m)
	list=$(echo "$pkgs" | grep "$kernel" | grep "$arch")
	target=""
	if echo "$list" | grep -q "musl" 2>&1 >/dev/null; then
		target=$(echo "$list" | grep "musl")
	else
		target=$(echo "$list" | grep "gnu")
	fi
	wget https://github.com/sharkdp/bat/releases/latest/download/$target
	tar -xvf $target
	folder="$(echo $target | awk -F '.tar.gz' '{ print $1 }')"
	cp ${folder}/bat bin/bat
	selection=$(find tools/ -type f -printf "%f\n" | awk -F '.' '{ print $1 }' | bin/sk --multi --bind 'right:select-all,left:deselect-all,space:toggle+up' --preview="bin/bat --color=always tools/{}.install.sh --color=always")
}

if test $# -eq 0; then
	_prompt
else
	selection="$(echo $@ | tr ' ' '\n' | sort -u | tr '\n' ' ' | xargs echo | sort)"
fi

for i in $selection; do
	if test -e "tools/$i.install.sh"; then
		sh "tools/$i.install.sh"
	fi
	if test -e "bashrc.d/$i"; then
		mkdir -p "$HOME/.bashrc.d/"
		cp "bashrc.d/$i" "$HOME/.bashrc.d/$i"
	fi
done

if test -n "$BW_SESSION"; then
    bw logout
    unset BW_SESSION
fi
