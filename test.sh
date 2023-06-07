set -o errexit
		#wget -q -O -  https://raw.githubusercontent.com/lotabout/skim/master/install | sh
		#info=$(curl https://api.github.com/repos/sharkdp/bat/releases/latest | jq .tag_name,.id -r)
		#tag=$(echo $info | awk -F ' ' '{ print $1 }')
		#id=$(echo $info | awk -F ' ' '{ print $2 }')
		#pkgs=$(curl https://api.github.com/repos/sharkdp/bat/releases/${id}/assets | jq .[].name -r)
		#kernel=$(uname -s | awk '{print tolower($0)}')
		#arch=$(uname -p)
		#filtered_list=$(echo "$pkgs" | grep "$kernel" | grep "$arch")
		#echo list=$filtered_list
		#target=""
		#if echo "$filtered_list" | grep -q "musl"; then
		#  target=$(echo "$filtered_list" | grep "musl")
		#else
		#  target=$(echo "$filtered_list" | grep "gnu")
		#fi
		#wget https://github.com/sharkdp/bat/releases/latest/download/$target
		#tar -xvf $target
		#folder="$(echo $target | awk -F '.tar.gz' '{ print $1 }')"
		#echo $folder
		#cp ${folder}/bat bin/bat
		#rm $folder $target -rf
selection=$(ls tools/ | awk -F '.' '{ print $1 }' | bin/sk --multi --bind 'right:select-all,left:deselect-all,space:toggle+up' --preview="bin/bat --color=always tools/{}.install.sh --color=always")
		#rm bin/ -rf
		#mkdir -p $HOME/.bashrc.d/
for i in $selection
do
	# install tool
	echo $i.install.sh
	# copy config file
	if [ -e bashrc.d/$i ]; then
		echo "cp bashrc.d/$i $HOME/.bashrc.d/$i"
	fi

done
