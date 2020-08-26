# 1

  ssh user@server "dd if=/dev/sda" | dd of=/home/user/disk-sda.img

# 2

  dd if=/dev/hda | ssh user@destination.com "dd of=/path/to/destination.iso"

# 3

  Remote system:
    nc -l -p 8001|bzip2 -d|dd bs=16M of=/dev/sdb
  then on the local system
    dd bs=16M if=/dev/sda|bzip2 -c|nc remote.system.tld 8001
