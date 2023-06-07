

set -o errexit
wget -q -O -  https://raw.githubusercontent.com/lotabout/skim/master/install | sh
#ls tools/ | awk -F '.' '{ print $1 }' | sk --preview="bat {} --color=always"
ls tools/ | awk -F '.' '{ print $1 }' | bin/sk --preview="cat tools/{}.install.sh"
rm bin/ -rf
