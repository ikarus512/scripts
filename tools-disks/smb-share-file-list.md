#!/usr/bin/env bash
domain=NTDOMAIN
user=user
pass=pass
## Ways to access smb share:
# 0) sudo apt-get install -y cifs-utils; sudo mkdir -p /mnt/local_share; sudo mount -t cifs -o user=$user //fileserver/data /mnt/local_share
# 1) mc built with smb or cifs:     /#smb:$user@fileserver/data
# 2) smbclient //fileserver/data/folder/subfolder/ -U $user  ##smbclient //fileserver/data -U $user%$pass
# 3) curl --upload-file $ifile -u '$domain\$user' smb://fileserver/data/file

#sudo $(which smb1)
ms="//fileserver1/data;//fileserver1/data & data"; IFS=';' read -ra MS <<< "$ms"
logf=/home/$USER/$(timestamp).smb.dir

 mount=yesn ##
    ls=yes  ##
umount=yesn ##



if [ $mount == yes ];then       i=0; for m in "${MS[@]}"; do let i=i+1
    echo "== mount $i: $m" >>$logf 2>&1
    mkdir -p /mnt/local_share$i
    mount -t cifs  -o user=$user "$m" /mnt/local_share$i
done; fi

if [ $ls == yes ];then     i=0; for m in "${MS[@]}"; do let i=i+1
    echo "== ls $i: $m" >>$logf 2>&1
    cd /home/e/w
    find . -name "*" -exec echo "$m/{}" \;   >>$logf 2>&1

    ## Print 1st level folders:
    #cat $logf | grep -oP "$m/\./[^/]+" | sort -u  ### output lines:   //fileserver1/data/./folder1

done; fi

if [ $umount == yes ];then    i=0; for m in "${MS[@]}"; do let i=i+1
    echo "== umount $i: $m" >>$logf 2>&1
    umount "$m" #"$(echo $m | perl -pe 's/( | \&)/\\$1/g;')"
done; fi
