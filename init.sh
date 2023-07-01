#!/bin/sh
set -o errexit
_isgit() {
	if git rev-parse --is-inside-work-tree 2>&1 > /dev/null; then
		INGIT=1
	else
		INGIT=0
	fi
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
	rm $folder $target -rf
	# Selection of files
	if [ $INGIT -eq 1 ]; then
		selection=$(curl -s https://api.github.com/repos/Ant0wan/config-and-tools/contents/tools | jq -r '.[].name' | awk -F '.' '{ print $1 }')
	else
		selection=$(find tools/ -type f -printf "%f\n" | awk -F '.' '{ print $1 }' | bin/sk --multi --bind 'right:select-all,left:deselect-all,space:toggle+up' --preview="bin/bat --color=always tools/{}.install.sh --color=always")
	fi
#	rm bin/ -rf
}

_isgit
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
