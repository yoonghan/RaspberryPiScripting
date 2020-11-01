# RaspberryPiScripting
Scripts to enable Raspberry Pi for connection and configuration

## Enabling PIN for bluetooth PAN connection
1. Run the following scripts

```
sudo apt upgrade 
sudo apt update
sudo apt install blueman network-manager-gnome
sudo reboot
```

2. Make sure sshd is started Preferences -> Raspberry Pi Configuration -> Interfaces, set SSH to enabled

3. Open blueman's from taskbar Local Services -> Select Network. Check "Network Access Point(NAP)" is enabled and set IP address to 10.1.1.2. Make sure PAN Support and DUN Support is set to Blueman.

3. Make sure this script is executed upon startup rc.d.
