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

4. Copy bluetooth-agent.sh to /etc/init.d

```
chmod a+x bluetooth-agent.sh
cd ../rc3.d
ln -s ../init.d/bluetooth-agent.sh S02bluetoothagent
```

5. Now need to change BLUETOOTH to enable default PIN number exchange,

```
cd /usr/lib/python3/dist-packages/blueman/main/applet
vi BluezAgent.py
```

6. Modify the scripts to *comment* off to disable ask_passkey, and then set 0000 to ok. 
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
