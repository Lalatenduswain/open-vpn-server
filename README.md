# OpenVPN Installer

This script is an OpenVPN installer that supports various Linux distributions, including Ubuntu, Debian, CentOS, and Fedora. It automates the installation of OpenVPN and generates custom client.ovpn files for connecting to the OpenVPN server.

## Requirements

- Linux operating system (Ubuntu, Debian, CentOS, Fedora)
- Superuser privileges (root access)
- TUN device enabled

## Usage

1. Download the `install_openvpn.sh` script to your Linux machine.

2. Open a terminal and navigate to the directory where the script is located.

3. Run the following command to make the script executable:

   ```
   chmod +x install_openvpn.sh
   ```

4. Execute the script with superuser privileges using the following command:

   ```
   sudo ./install_openvpn.sh
   ```
   Else
   ```
	wget https://raw.githubusercontent.com/Lalatenduswain/open-vpn-server/master/install_openvpn.sh -O install_openvpn.sh && bash install_openvpn.sh
   ```

6. Follow the on-screen instructions provided by the script.

7. Once the installation is complete, the script will generate a `client.ovpn` file for each client that you create. These files can be used to configure OpenVPN clients for connecting to the server.

8. Share the `client.ovpn` files with your clients, along with instructions on how to configure their OpenVPN clients using the generated file.

## Notes

- It is important to ensure that the script is run with "bash" and not "sh" to avoid compatibility issues.
- The script requires superuser privileges to install and configure OpenVPN.
- Make sure the TUN device is enabled on your system before running the script.
- The script supports both IPv4 and IPv6 addresses and prompts you to choose the appropriate options during the installation process.
- The installer generates a self-signed certificate authority (CA) and server certificate using Easy-RSA.
- The OpenVPN server is configured with the chosen protocol (UDP or TCP), port number, and DNS server.
- The script sets up iptables rules for network traffic forwarding and enables IP forwarding on the server.
- Once the installation is complete, the script provides instructions for creating client certificates and generating the `client.ovpn` files.

### Donations

If you want to show your appreciation, you can donate via [BuymeaCoffee](https://www.buymeacoffee.com/lalatendu.swain)

## Disclaimer

This script is provided as-is and may require modifications or updates based on your specific environment and requirements. Use it at your own risk. The authors of the script are not liable for any damages or issues caused by its usage.
