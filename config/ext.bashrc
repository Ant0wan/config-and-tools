
# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
	for rc in ~/.bashrc.d/*; do
		if [ -f "$rc" ]; then
			. "$rc"
		fi
	done
fi

unset rc

## Extensions
# Load Bash extensions
function load() {
	test -e ~/.bashrc.d/$1 || echo "load: error loading config: $1 not found"
	source ~/.bashrc.d/$1
}
complete -W '$(ls ~/.bashrc.d/)' load

load terraform
