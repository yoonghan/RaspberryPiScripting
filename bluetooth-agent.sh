
# Set 0 for not asking for PIN, 1 is to set for PIN reqeust
sudo hciconfig hci0 sspmode 0

# Make it discoverable upon start up
sudo bluetoothctl <<EOF
discoverable on
pairable on
EOF
