#!/bin/sh
set -o errexit
if test -e "$HOME"/.ssh/github; then
	echo "SSH already configure."
	exit 0
fi
if test -z "$BW_SESSION"; then
    BW_SESSION=$(bw login --raw)
    export BW_SESSION
fi
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
bw logout
