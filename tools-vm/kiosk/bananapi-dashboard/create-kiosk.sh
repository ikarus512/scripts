#!/usr/bin/env bash

### Add kioskfile.sh to startup script, way 1
# ### (but this will run in any user session?)
# f=/home/$KIOSK_USER/.profile; grep "/home/$KIOSK_USER/kioskfile.sh" $f \
#     || sudo bash -c "echo >> $f; echo \"/home/$KIOSK_USER/kioskfile.sh\" >> $f"

KIOSK_USER=pi

### Add kioskfile.sh to startup script, way 2
sudo mkdir -p /home/$KIOSK_USER/.config/autostart
sudo chmod 777 /home/$KIOSK_USER/.config /home/$KIOSK_USER/.config/autostart
f=/home/$KIOSK_USER/.config/autostart/kioskfile.desktop
sudo su -c "cat > $f" << EOF
[Desktop Entry]
Type=Application
Name=Kiosk
#Exec=/home/$KIOSK_USER/kioskfile.sh
X-GNOME-Autostart-enabled=true
X-MATE-Autostart-enabled=true
EOF
sudo bash -c "echo \"Exec=/home/$KIOSK_USER/kioskfile.sh\" >> $f"



### And reboot
#sudo systemctl reboot -i
