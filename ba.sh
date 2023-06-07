info=$(curl https://api.github.com/repos/sharkdp/bat/releases/latest | jq .tag_name,.id -r)
tag=$(echo $info | awk -F ' ' '{ print $1 }')
id=$(echo $info | awk -F ' ' '{ print $2 }')
echo "tag=$tag"
echo "id=$id"
pkgs=$(curl https://api.github.com/repos/sharkdp/bat/releases/${id}/assets | jq .[].name -r)
echo $pkgs
