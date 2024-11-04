#!/bin/bash
set -o errexit

download_path=$(mktemp -d -t conf.XXXXXXXXXX)
cd "$download_path"

wget -q https://github.com/Ant0wan/conf/archive/refs/heads/main.zip
unzip -q main.zip
cd "${download_path}/conf-main"

wget -qO- https://raw.githubusercontent.com/lotabout/skim/master/install | bash 1>/dev/null 2>&1

id=$(wget -qO- https://api.github.com/repos/sharkdp/bat/releases/latest 2>/dev/null | jq .tag_name,.id -r | awk 'NR==2')
pkgs="$(wget -qO- "https://api.github.com/repos/sharkdp/bat/releases/${id}/assets" 2>/dev/null | jq .[].name -r)"
target=($(echo "$pkgs" | grep -i "$(uname -s)" | grep -i "$(uname -m)"))
wget "https://github.com/sharkdp/bat/releases/latest/download/$target" 2>/dev/null
tar -xf "$target"
folder="$(echo "$target" | awk -F '.tar.gz' '{ print $1 }')"
cp "${folder}/bat" bin/bat

selection="$(find scripts/ -type f -printf "%f\n" | awk -F '.' '{ print $1 }' | sort | bin/sk --multi --bind 'right:select-all,left:deselect-all,space:toggle+up' --preview="bin/bat --color=always scripts/{}.sh --color=always")"

for i in $selection; do
	[ -e "scripts/$i.sh" ] && sh "scripts/$i.sh"
	[ -e "bashrc.d/$i" ] && mkdir -p "$HOME/.bashrc.d/" && cp "bashrc.d/$i" "$HOME/.bashrc.d/$i"
done

[ -n "$BW_SESSION" ] && bw logout && unset BW_SESSION

rm -rf "${download_path}"
