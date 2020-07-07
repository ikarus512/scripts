lsblk
df -h
sudo dd if=/path/to/ubuntu.iso of=/dev/sdX bs=4M status=progress && sync
exit
sudo apt install syslinux-utils syslinux mtools -y
exit
isohybrid win7-lic.iso
exit
sudo umount /dev/sdc
sudo umount /dev/sdc1
exit

### https://superuser.com/questions/591234/how-to-create-a-bootable-usb-from-a-bootable-iso-with-the-command-line-on-linux

Ok after some research I've figured out a solution, and I'll go through it step by step. Problem was two-fold.

1. Plug in the USB flash drive and determine the device it's mounted on with the command:

 sudo fdisk -l

This time around it was /dev/sdc1 for me, so I'll use that as my example.

2. Umount the device

 umount /dev/sdc1

3. Not sure if necessary but I formatted the drive in FAT32, just in case

 sudo mkdosfs -n 'USB-Drive-Name' -I /dev/sdc -F 32

4. Now my ISO was using isolinux not syslinux. I knew it worked with CDs so I figured out that I needed to call the isohybrid command, which allows for an ISO to be recognized by the BIOS from a hard drive.

 isohybrid filename.iso

You can find out more about this command here, but this was the cause of the message "Missing Operating System" The first problem was fixed, but now it said "isolinux.bin was missing or corrupt"

5. The next step is to copy the iso. My second problem lay here, where I was copying to the partition, sdc1, not the device, sdc.

 sudo dd if=filename.iso of=/dev/sdc bs=4k

This seems to work just fine, but the forum where I got the last fix, it was recommended to do the following before unplugging the device:

 sync
 sudo eject /dev/s




