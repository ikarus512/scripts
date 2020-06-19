if [ -z $admkiosk ];then admkiosk=admkiosk; fi
if [ -z $kiosk_ip ];then kiosk_ip=192.192.192.192; fi

scp create-kiosk.sh kioskfile.sh $admkiosk@$kiosk_ip:/home/$admkiosk/
ssh -t $admkiosk@$kiosk_ip "./create-kiosk.sh"
# ssh -t $admkiosk@$kiosk_ip "sudo systemctl reboot -i"
# sleep 10s; ssh -t $admkiosk@$kiosk_ip 'f=$(ls /home/kiosk/*.log|tail -n 1); echo f=$f; cat $f'
