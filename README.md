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

4. Copy bluetooth-agent.sh to /home/pi, and create it as executable. Then append into /home/pi/.bashrc file, it has to be the last file.

```
chmod a+x bluetooth-agent.sh
```

5. Now need to change BLUETOOTH to enable default PIN number exchange,

```
cd /usr/lib/python3/dist-packages/blueman/main/applet
vi BluezAgent.py
```

6. Modify the scripts to *comment* off dialog box pop ups. Then set 0000 into "ok" function that will start to send default 0000 PIN no. 
```
  @AgentMethod
  def RequestPinCode(self, device, ok, err):
  ...
  # self.ask_passkey(device, dialog_msg, notify_msg, False, self.notifications, ok, err)
  # if self.dialog:
  #     self.dialog.present_with_time(self.time_func())
  ok(0000);
  
  @AgentMethod
  def RequestPassKey(self, device, ok, err):
  ...
  # self.ask_passkey(device, dialog_msg, notify_msg, True, self.notifications, ok, err)
  # if self.dialog:
  #     self.dialog.present_with_time(self.time_func())
  ok(0000);
```

7. Reboot, Make sure Bluetooth is now in "Discoverable".

8. Connect from PC for to Bluetooth and wait to find "raspberrypi". After connect in MacOS, you need to right-click "Connect To Network".

9. ssh to pi@10.1.1.2
