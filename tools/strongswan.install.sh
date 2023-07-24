#!/bin/sh
set -xe
network_name='your_netowrk_here'
VPN_Gateway='your_gateway_here'
VPN_Username='your_username_here'
VPN_Password='your_password_here'

# Check if /etc/os-release exists
if [ -f /etc/os-release ]; then
    # Source the /etc/os-release file to get the ID variable
    . /etc/os-release

    # Check the distribution ID and use the appropriate package manager
    case "$ID" in
        fedora|centos|rhel)
            # Use dnf if the distribution is Fedora, CentOS, or RHEL
            package_manager="dnf"
            packages="NetworkManager-strongswan NetworkManager-strongswan-gnome strongswan-charon-nm strongswan strongswan-sqlite"
            cacerts='/etc/strongswan/ipsec.d/cacerts/cacert.pem'
            ;;
        debian|ubuntu)
            # Use apt-get if the distribution is Debian or Ubuntu
            package_manager="apt-get"
            packages="strongswan strongswan-nm network-manager-strongswan"
            cacerts='/etc/ipsec.d/cacerts/cacerts.pem'
            ;;
        *)
            # If the distribution is not recognized, exit with an error
            echo "Unsupported distribution: $ID"
            exit 1
            ;;
    esac

    # Install packages using the identified package manager
    sudo "$package_manager" install -y $packages

    # Download the CA certificate from a trusted source
    sudo wget https://curl.se/ca/cacert.pem -O "$cacerts"

    # Create a new VPN connection with NetworkManager using strongSwan plugin
    sudo nmcli connection add type vpn con-name "$network_name" ifname "*" vpn-type strongswan \
        vpn.data "address=$VPN_Gateway, method=eap, user=$VPN_Username, virtual=yes, encap=yes" \
        vpn.secrets "password=$VPN_Password" \
        ipv4.method "auto" \
        ipv6.method "auto"

else
    # If /etc/os-release is not found, exit with an error
    echo "Unable to identify the Linux distribution."
    exit 1
fi
