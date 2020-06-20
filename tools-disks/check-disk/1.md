# 1. ubuntu SMART: https://help.ubuntu.com/stable/ubuntu-help/disk-check.html.en




# 2. using fsk:  https://www.fosslinux.com/1297/check-hard-disk-for-bad-sectors-and-errors-by-command-line-in-ubuntu-and-linux-mint.htm

Step 1: First, let’s use the fdisk command to find out the hard disk partitions status.
 sudo fdisk -l

Step 2: Next, let’s find if there are any Bad Sectors on the hard disk. We shall use badblocks command
 # https://en.wikipedia.org/wiki/Badblocks
 sudo badblocks -v /dev/sda > /scan_result/badsectors.txt

Step 3: Finally we shall use fsck command to tell Ubuntu not to use the bad sectors mentioned
 # https://en.wikipedia.org/wiki/Fsck
 sudo fsck -l /scan_result/badsectors.txt /dev/sda

