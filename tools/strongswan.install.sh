#!/bin/sh
set -xe
network_name=''
VPN_Gateway=''
VPN_Username=''
VPN_Password=''
cacerts='/etc/strongswan/ipsec.d/cacerts/cacert.pem'
dnf install -y NetworkManager-strongswan NetworkManager-strongswan-gnome strongswan-charon-nm strongswan strongswan-sqlite 
# libtnc strongswan-tnc-imcvs
wget https://curl.se/ca/cacert.pem -O "$cacerts"
sudo nmcli connection add type vpn con-name "$network_name" ifname "*" vpn-type strongswan \
vpn.data "address=$VPN_Gateway, method=eap, user=$VPN_Username, virtual=yes, encap=yes" \
vpn.secrets "password=$VPN_Password" \
ipv4.method "auto" \
ipv6.method "auto"
