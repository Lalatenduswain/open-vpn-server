#!/bin/bash
#
#
# OpenVPN Installer
#
# This script installs OpenVPN on supported distributions (Ubuntu, Debian, CentOS, and Fedora).
# It also generates custom client.ovpn files for connecting to the OpenVPN server.

# Detect Debian users running the script with "sh" instead of "bash"
if readlink /proc/$$/exe | grep -q "dash"; then
	echo 'This installer needs to be run with "bash", not "sh".'
	exit
fi

# Discard stdin. Needed when running from a one-liner which includes a newline
read -N 999999 -t 0.001

# Detect OpenVZ 6
if [[ $(uname -r | cut -d "." -f 1) -eq 2 ]]; then
	echo "The system is running an old kernel, which is incompatible with this installer."
	exit
fi

# Detect the operating system and version
if grep -qs "ubuntu" /etc/os-release; then
	os="Ubuntu"
	os_version=$(grep 'VERSION_ID' /etc/os-release | cut -d '"' -f 2 | tr -d '.')
	group_name="nogroup"
elif [[ -e /etc/debian_version ]]; then
	os="Debian"
	os_version=$(grep -oE '[0-9]+' /etc/debian_version | head -1)
	group_name="nogroup"
elif [[ -e /etc/centos-release ]]; then
	os="CentOS"
	os_version=$(grep -oE '[0-9]+' /etc/centos-release | head -1)
	group_name="nobody"
elif [[ -e /etc/fedora-release ]]; then
	os="Fedora"
	os_version=$(grep -oE '[0-9]+' /etc/fedora-release | head -1)
	group_name="nobody"
else
	echo "This installer seems to be running on an unsupported distribution.
Supported distributions are Ubuntu, Debian, CentOS, and Fedora."
	exit
fi

# Check if the OS version is supported
if [[ "$os" == "Ubuntu" && "$os_version" -lt 1804 ]]; then
	echo "Ubuntu 18.04 or higher is required to use this installer.
This version of Ubuntu is too old and unsupported."
	exit
fi

if [[ "$os" == "Debian" && "$os_version" -lt 9 ]]; then
	echo "Debian 9 or higher is required to use this installer.
This version of Debian is too old and unsupported."
	exit
fi

if [[ "$os" == "CentOS" && "$os_version" -lt 7 ]]; then
	echo "CentOS 7 or higher is required to use this installer.
This version of CentOS is too old and unsupported."
	exit
fi

# Check if the script is running with superuser privileges
if [[ "$EUID" -ne 0 ]]; then
	echo "This installer needs to be run with superuser privileges."
	exit
fi

# Check if the TUN device is available
if [[ ! -e /dev/net/tun ]] || ! ( exec 7<>/dev/net/tun ) 2>/dev/null; then
	echo "The system does not have the TUN device available.
TUN needs to be enabled before running this installer."
	exit
fi

# Function to generate custom client.ovpn files
new_client () {
	{
		cat /etc/openvpn/server/client-common.txt
		echo "<ca>"
		cat /etc/openvpn/server/easy-rsa/pki/ca.crt
		echo "</ca>"
		echo "<cert>"
		sed -ne '/BEGIN CERTIFICATE/,$ p' /etc/openvpn/server/e

#!/bin/bash
#
#
# OpenVPN Installer
#
# This script installs OpenVPN on supported distributions (Ubuntu, Debian, CentOS, and Fedora).
# It also generates custom client.ovpn files for connecting to the OpenVPN server.

# Detect Debian users running the script with "sh" instead of "bash"
if readlink /proc/$$/exe | grep -q "dash"; then
	echo 'This installer needs to be run with "bash", not "sh".'
	exit
fi

# Discard stdin. Needed when running from a one-liner which includes a newline
read -N 999999 -t 0.001

# Detect OpenVZ 6
if [[ $(uname -r | cut -d "." -f 1) -eq 2 ]]; then
	echo "The system is running an old kernel, which is incompatible with this installer."
	exit
fi

# Detect the operating system and version
if grep -qs "ubuntu" /etc/os-release; then
	os="Ubuntu"
	os_version=$(grep 'VERSION_ID' /etc/os-release | cut -d '"' -f 2 | tr -d '.')
	group_name="nogroup"
elif [[ -e /etc/debian_version ]]; then
	os="Debian"
	os_version=$(grep -oE '[0-9]+' /etc/debian_version | head -1)
	group_name="nogroup"
elif [[ -e /etc/centos-release ]]; then
	os="CentOS"
	os_version=$(grep -oE '[0-9]+' /etc/centos-release | head -1)
	group_name="nobody"
elif [[ -e /etc/fedora-release ]]; then
	os="Fedora"
	os_version=$(grep -oE '[0-9]+' /etc/fedora-release | head -1)
	group_name="nobody"
else
	echo "This installer seems to be running on an unsupported distribution.
Supported distributions are Ubuntu, Debian, CentOS, and Fedora."
	exit
fi

# Check if the OS version is supported
if [[ "$os" == "Ubuntu" && "$os_version" -lt 1804 ]]; then
	echo "Ubuntu 18.04 or higher is required to use this installer.
This version of Ubuntu is too old and unsupported."
	exit
fi

if [[ "$os" == "Debian" && "$os_version" -lt 9 ]]; then
	echo "Debian 9 or higher is required to use this installer.
This version of Debian is too old and unsupported."
	exit
fi

if [[ "$os" == "CentOS" && "$os_version" -lt 7 ]]; then
	echo "CentOS 7 or higher is required to use this installer.
This version of CentOS is too old and unsupported."
	exit
fi

# Check if the script is running with superuser privileges
if [[ "$EUID" -ne 0 ]]; then
	echo "This installer needs to be run with superuser privileges."
	exit
fi

# Check if the TUN device is available
if [[ ! -e /dev/net/tun ]] || ! ( exec 7<>/dev/net/tun ) 2>/dev/null; then
	echo "The system does not have the TUN device available.
TUN needs to be enabled before running this installer."
	exit
fi

# Function to generate custom client.ovpn files
new_client () {
	{
		cat /etc/openvpn/server/client-common.txt
		echo "<ca>"
		cat /etc/openvpn/server/easy-rsa/pki/ca.crt
		echo "</ca>"
		echo "<cert>"
		sed -ne '/BEGIN CERTIFICATE/,$ p' /etc/openvpn/server/e

#!/bin/bash
#
#
# OpenVPN Installer
#
# This script installs OpenVPN on supported distributions (Ubuntu, Debian, CentOS, and Fedora).
# It also generates custom client.ovpn files for connecting to the OpenVPN server.

# Detect Debian users running the script with "sh" instead of "bash"
if readlink /proc/$$/exe | grep -q "dash"; then
	echo 'This installer needs to be run with "bash", not "sh".'
	exit
fi

# Discard stdin. Needed when running from a one-liner which includes a newline
read -N 999999 -t 0.001

# Detect OpenVZ 6
if [[ $(uname -r | cut -d "." -f 1) -eq 2 ]]; then
	echo "The system is running an old kernel, which is incompatible with this installer."
	exit
fi

# Detect the operating system and version
if grep -qs "ubuntu" /etc/os-release; then
	os="Ubuntu"
	os_version=$(grep 'VERSION_ID' /etc/os-release | cut -d '"' -f 2 | tr -d '.')
	group_name="nogroup"
elif [[ -e /etc/debian_version ]]; then
	os="Debian"
	os_version=$(grep -oE '[0-9]+' /etc/debian_version | head -1)
	group_name="nogroup"
elif [[ -e /etc/centos-release ]]; then
	os="CentOS"
	os_version=$(grep -oE '[0-9]+' /etc/centos-release | head -1)
	group_name="nobody"
elif [[ -e /etc/fedora-release ]]; then
	os="Fedora"
	os_version=$(grep -oE '[0-9]+' /etc/fedora-release | head -1)
	group_name="nobody"
else
	echo "This installer seems to be running on an unsupported distribution.
Supported distributions are Ubuntu, Debian, CentOS, and Fedora."
	exit
fi

# Check if the OS version is supported
if [[ "$os" == "Ubuntu" && "$os_version" -lt 1804 ]]; then
	echo "Ubuntu 18.04 or higher is required to use this installer.
This version of Ubuntu is too old and unsupported."
	exit
fi

if [[ "$os" == "Debian" && "$os_version" -lt 9 ]]; then
	echo "Debian 9 or higher is required to use this installer.
This version of Debian is too old and unsupported."
	exit
fi

if [[ "$os" == "CentOS" && "$os_version" -lt 7 ]]; then
	echo "CentOS 7 or higher is required to use this installer.
This version of CentOS is too old and unsupported."
	exit
fi

# Check if the script is running with superuser privileges
if [[ "$EUID" -ne 0 ]]; then
	echo "This installer needs to be run with superuser privileges."
	exit
fi

# Check if the TUN device is available
if [[ ! -e /dev/net/tun ]] || ! ( exec 7<>/dev/net/tun ) 2>/dev/null; then
	echo "The system does not have the TUN device available.
TUN needs to be enabled before running this installer."
	exit
fi

# Function to generate custom client.ovpn files
new_client () {
	{
		cat /etc/openvpn/server/client-common.txt
		echo "<ca>"
		cat /etc/openvpn/server/easy-rsa/pki/ca.crt
		echo "</ca>"
		echo "<cert>"
		sed -ne '/BEGIN CERTIFICATE/,$ p' /etc/openvpn/server/e

#!/bin/bash
#
#
# OpenVPN Installer
#
# This script installs OpenVPN on supported distributions (Ubuntu, Debian, CentOS, and Fedora).
# It also generates custom client.ovpn files for connecting to the OpenVPN server.

# Detect Debian users running the script with "sh" instead of "bash"
if readlink /proc/$$/exe | grep -q "dash"; then
	echo 'This installer needs to be run with "bash", not "sh".'
	exit
fi

# Discard stdin. Needed when running from a one-liner which includes a newline
read -N 999999 -t 0.001

# Detect OpenVZ 6
if [[ $(uname -r | cut -d "." -f 1) -eq 2 ]]; then
	echo "The system is running an old kernel, which is incompatible with this installer."
	exit
fi

# Detect the operating system and version
if grep -qs "ubuntu" /etc/os-release; then
	os="Ubuntu"
	os_version=$(grep 'VERSION_ID' /etc/os-release | cut -d '"' -f 2 | tr -d '.')
	group_name="nogroup"
elif [[ -e /etc/debian_version ]]; then
	os="Debian"
	os_version=$(grep -oE '[0-9]+' /etc/debian_version | head -1)
	group_name="nogroup"
elif [[ -e /etc/centos-release ]]; then
	os="CentOS"
	os_version=$(grep -oE '[0-9]+' /etc/centos-release | head -1)
	group_name="nobody"
elif [[ -e /etc/fedora-release ]]; then
	os="Fedora"
	os_version=$(grep -oE '[0-9]+' /etc/fedora-release | head -1)
	group_name="nobody"
else
	echo "This installer seems to be running on an unsupported distribution.
Supported distributions are Ubuntu, Debian, CentOS, and Fedora."
	exit
fi

# Check if the OS version is supported
if [[ "$os" == "Ubuntu" && "$os_version" -lt 1804 ]]; then
	echo "Ubuntu 18.04 or higher is required to use this installer.
This version of Ubuntu is too old and unsupported."
	exit
fi

if [[ "$os" == "Debian" && "$os_version" -lt 9 ]]; then
	echo "Debian 9 or higher is required to use this installer.
This version of Debian is too old and unsupported."
	exit
fi

if [[ "$os" == "CentOS" && "$os_version" -lt 7 ]]; then
	echo "CentOS 7 or higher is required to use this installer.
This version of CentOS is too old and unsupported."
	exit
fi

# Check if the script is running with superuser privileges
if [[ "$EUID" -ne 0 ]]; then
	echo "This installer needs to be run with superuser privileges."
	exit
fi

# Check if the TUN device is available
if [[ ! -e /dev/net/tun ]] || ! ( exec 7<>/dev/net/tun ) 2>/dev/null; then
	echo "The system does not have the TUN device available.
TUN needs to be enabled before running this installer."
	exit
fi

# Function to generate custom client.ovpn files
new_client () {
	{
		cat /etc/openvpn/server/client-common.txt
		echo "<ca>"
		cat /etc/openvpn/server/easy-rsa/pki/ca.crt
		echo "</ca>"
		echo "<cert>"
		sed -ne '/BEGIN CERTIFICATE/,$ p' /etc/openvpn/server/e

#!/bin/bash
#
#
# OpenVPN Installer
#
# This script installs OpenVPN on supported distributions (Ubuntu, Debian, CentOS, and Fedora).
# It also generates custom client.ovpn files for connecting to the OpenVPN server.

# Detect Debian users running the script with "sh" instead of "bash"
if readlink /proc/$$/exe | grep -q "dash"; then
	echo 'This installer needs to be run with "bash", not "sh".'
	exit
fi

# Discard stdin. Needed when running from a one-liner which includes a newline
read -N 999999 -t 0.001

# Detect OpenVZ 6
if [[ $(uname -r | cut -d "." -f 1) -eq 2 ]]; then
	echo "The system is running an old kernel, which is incompatible with this installer."
	exit
fi

# Detect the operating system and version
if grep -qs "ubuntu" /etc/os-release; then
	os="Ubuntu"
	os_version=$(grep 'VERSION_ID' /etc/os-release | cut -d '"' -f 2 | tr -d '.')
	group_name="nogroup"
elif [[ -e /etc/debian_version ]]; then
	os="Debian"
	os_version=$(grep -oE '[0-9]+' /etc/debian_version | head -1)
	group_name="nogroup"
elif [[ -e /etc/centos-release ]]; then
	os="CentOS"
	os_version=$(grep -oE '[0-9]+' /etc/centos-release | head -1)
	group_name="nobody"
elif [[ -e /etc/fedora-release ]]; then
	os="Fedora"
	os_version=$(grep -oE '[0-9]+' /etc/fedora-release | head -1)
	group_name="nobody"
else
	echo "This installer seems to be running on an unsupported distribution.
Supported distributions are Ubuntu, Debian, CentOS, and Fedora."
	exit
fi

# Check if the OS version is supported
if [[ "$os" == "Ubuntu" && "$os_version" -lt 1804 ]]; then
	echo "Ubuntu 18.04 or higher is required to use this installer.
This version of Ubuntu is too old and unsupported."
	exit
fi

if [[ "$os" == "Debian" && "$os_version" -lt 9 ]]; then
	echo "Debian 9 or higher is required to use this installer.
This version of Debian is too old and unsupported."
	exit
fi

if [[ "$os" == "CentOS" && "$os_version" -lt 7 ]]; then
	echo "CentOS 7 or higher is required to use this installer.
This version of CentOS is too old and unsupported."
	exit
fi

# Check if the script is running with superuser privileges
if [[ "$EUID" -ne 0 ]]; then
	echo "This installer needs to be run with superuser privileges."
	exit
fi

# Check if the TUN device is available
if [[ ! -e /dev/net/tun ]] || ! ( exec 7<>/dev/net/tun ) 2>/dev/null; then
	echo "The system does not have the TUN device available.
TUN needs to be enabled before running this installer."
	exit
fi

# Function to generate custom client.ovpn files
new_client () {
	{
		cat /etc/openvpn/server/client-common.txt
		echo "<ca>"
		cat /etc/openvpn/server/easy-rsa/pki/ca.crt
		echo "</ca>"
		echo "<cert>"
		sed -ne '/BEGIN CERTIFICATE/,$ p' /etc/openvpn/server/e

#!/bin/bash
#
#
# OpenVPN Installer
#
# This script installs OpenVPN on supported distributions (Ubuntu, Debian, CentOS, and Fedora).
# It also generates custom client.ovpn files for connecting to the OpenVPN server.

# Detect Debian users running the script with "sh" instead of "bash"
if readlink /proc/$$/exe | grep -q "dash"; then
	echo 'This installer needs to be run with "bash", not "sh".'
	exit
fi

# Discard stdin. Needed when running from a one-liner which includes a newline
read -N 999999 -t 0.001

# Detect OpenVZ 6
if [[ $(uname -r | cut -d "." -f 1) -eq 2 ]]; then
	echo "The system is running an old kernel, which is incompatible with this installer."
	exit
fi

# Detect the operating system and version
if grep -qs "ubuntu" /etc/os-release; then
	os="Ubuntu"
	os_version=$(grep 'VERSION_ID' /etc/os-release | cut -d '"' -f 2 | tr -d '.')
	group_name="nogroup"
elif [[ -e /etc/debian_version ]]; then
	os="Debian"
	os_version=$(grep -oE '[0-9]+' /etc/debian_version | head -1)
	group_name="nogroup"
elif [[ -e /etc/centos-release ]]; then
	os="CentOS"
	os_version=$(grep -oE '[0-9]+' /etc/centos-release | head -1)
	group_name="nobody"
elif [[ -e /etc/fedora-release ]]; then
	os="Fedora"
	os_version=$(grep -oE '[0-9]+' /etc/fedora-release | head -1)
	group_name="nobody"
else
	echo "This installer seems to be running on an unsupported distribution.
Supported distributions are Ubuntu, Debian, CentOS, and Fedora."
	exit
fi

# Check if the OS version is supported
if [[ "$os" == "Ubuntu" && "$os_version" -lt 1804 ]]; then
	echo "Ubuntu 18.04 or higher is required to use this installer.
This version of Ubuntu is too old and unsupported."
	exit
fi

if [[ "$os" == "Debian" && "$os_version" -lt 9 ]]; then
	echo "Debian 9 or higher is required to use this installer.
This version of Debian is too old and unsupported."
	exit
fi

if [[ "$os" == "CentOS" && "$os_version" -lt 7 ]]; then
	echo "CentOS 7 or higher is required to use this installer.
This version of CentOS is too old and unsupported."
	exit
fi

# Check if the script is running with superuser privileges
if [[ "$EUID" -ne 0 ]]; then
	echo "This installer needs to be run with superuser privileges."
	exit
fi

# Check if the TUN device is available
if [[ ! -e /dev/net/tun ]] || ! ( exec 7<>/dev/net/tun ) 2>/dev/null; then
	echo "The system does not have the TUN device available.
TUN needs to be enabled before running this installer."
	exit
fi

# Function to generate custom client.ovpn files
new_client () {
	{
		cat /etc/openvpn/server/client-common.txt
		echo "<ca>"
		cat /etc/openvpn/server/easy-rsa/pki/ca.crt
		echo "</ca>"
		echo "<cert>"
		sed -ne '/BEGIN CERTIFICATE/,$ p' /etc/openvpn/server/e

#!/bin/bash
#
#
# OpenVPN Installer
#
# This script installs OpenVPN on supported distributions (Ubuntu, Debian, CentOS, and Fedora).
# It also generates custom client.ovpn files for connecting to the OpenVPN server.

# Detect Debian users running the script with "sh" instead of "bash"
if readlink /proc/$$/exe | grep -q "dash"; then
	echo 'This installer needs to be run with "bash", not "sh".'
	exit
fi

# Discard stdin. Needed when running from a one-liner which includes a newline
read -N 999999 -t 0.001

# Detect OpenVZ 6
if [[ $(uname -r | cut -d "." -f 1) -eq 2 ]]; then
	echo "The system is running an old kernel, which is incompatible with this installer."
	exit
fi

# Detect the operating system and version
if grep -qs "ubuntu" /etc/os-release; then
	os="Ubuntu"
	os_version=$(grep 'VERSION_ID' /etc/os-release | cut -d '"' -f 2 | tr -d '.')
	group_name="nogroup"
elif [[ -e /etc/debian_version ]]; then
	os="Debian"
	os_version=$(grep -oE '[0-9]+' /etc/debian_version | head -1)
	group_name="nogroup"
elif [[ -e /etc/centos-release ]]; then
	os="CentOS"
	os_version=$(grep -oE '[0-9]+' /etc/centos-release | head -1)
	group_name="nobody"
elif [[ -e /etc/fedora-release ]]; then
	os="Fedora"
	os_version=$(grep -oE '[0-9]+' /etc/fedora-release | head -1)
	group_name="nobody"
else
	echo "This installer seems to be running on an unsupported distribution.
Supported distributions are Ubuntu, Debian, CentOS, and Fedora."
	exit
fi

# Check if the OS version is supported
if [[ "$os" == "Ubuntu" && "$os_version" -lt 1804 ]]; then
	echo "Ubuntu 18.04 or higher is required to use this installer.
This version of Ubuntu is too old and unsupported."
	exit
fi

if [[ "$os" == "Debian" && "$os_version" -lt 9 ]]; then
	echo "Debian 9 or higher is required to use this installer.
This version of Debian is too old and unsupported."
	exit
fi

if [[ "$os" == "CentOS" && "$os_version" -lt 7 ]]; then
	echo "CentOS 7 or higher is required to use this installer.
This version of CentOS is too old and unsupported."
	exit
fi

# Check if the script is running with superuser privileges
if [[ "$EUID" -ne 0 ]]; then
	echo "This installer needs to be run with superuser privileges."
	exit
fi

# Check if the TUN device is available
if [[ ! -e /dev/net/tun ]] || ! ( exec 7<>/dev/net/tun ) 2>/dev/null; then
	echo "The system does not have the TUN device available.
TUN needs to be enabled before running this installer."
	exit
fi

# Function to generate custom client.ovpn files
new_client () {
	{
		cat /etc/openvpn/server/client-common.txt
		echo "<ca>"
		cat /etc/openvpn/server/easy-rsa/pki/ca.crt
		echo "</ca>"
		echo "<cert>"
		sed -ne '/BEGIN CERTIFICATE/,$ p' /etc/openvpn/server/e

This script is an OpenVPN installer that supports various Linux distributions (Ubuntu, Debian, CentOS, and Fedora). It installs OpenVPN and generates custom client.ovpn files for connecting to the OpenVPN server.

The script performs the following steps:

1. It checks if the script is being run with the "bash" command and not "sh".
2. It discards stdin to handle cases where the script is run as a one-liner.
3. It detects if the system is running an incompatible kernel (OpenVZ 6) and exits if it is.
4. It detects the operating system and version by checking specific files (os-release, debian_version, centos-release, fedora-release).
5. It checks if the OS version is supported and exits if it's not.
6. It checks if the script is run with superuser privileges and exits if it's not.
7. It checks if the TUN device is available, which is required for OpenVPN, and exits if it's not.
8. It defines a function to generate custom client.ovpn files by concatenating various OpenVPN configuration files.
9. It checks if the OpenVPN server configuration file (/etc/openvpn/server/server.conf) exists and proceeds if it does.
10. It prompts the user for IPv4 and IPv6 addresses to be used by the OpenVPN server.
11. It checks if the server is behind NAT and prompts for the public IPv4 address or hostname if it is.
12. It prompts the user to choose the protocol (UDP or TCP) for OpenVPN to use.
13. It prompts the user to choose the port number for OpenVPN to listen on.
14. It prompts the user to choose the DNS server to be pushed to clients.
15. It generates Diffie-Hellman parameters for key exchange.
16. It generates a self-signed certificate authority (CA) and server certificate using Easy-RSA.
17. It generates TLS cryptographic parameters.
18. It configures the OpenVPN server by updating the server configuration file.
19. It enables IP forwarding and sets up iptables rules for network traffic forwarding.
20. It restarts the OpenVPN service and enables it to start on boot.
21. It prompts the user to create a client certificate and generates the client.ovpn file using the new_client function.
22. It displays the success message and provides instructions for client configuration.

Please note that the script is provided as an example and may require modifications or updates depending on the specific environment and requirements.
