# Method 2: Using iproute2
First, turn off the Network card using command:

  sudo ip link set dev enp0s3 down
Next, set the new MAC is using command:

  sudo ip link set dev enp0s3 address XX:XX:XX:XX:XX:XX
Finally, turn it on back with command:

  sudo ip link set dev enp0s3 up
Now, verify new MAC id using command:

  ip link show enp0s3

Sample output:
link/ether xx:xx:xx:xx:xx:xx brd ff:ff:ff:ff:ff:ff




# Alternatively, you can do this using ‘ifconfig’ command as described below.
mac="00:80:48:BA:d1:30"; sudo ifconfig eth0 down; sudo ifconfig eth0 hw ether $mac; sudo ifconfig eth0 up; ifconfig eth0 | grep HWaddr
sudo ifconfig eth0 hw ether $mac; reboot
