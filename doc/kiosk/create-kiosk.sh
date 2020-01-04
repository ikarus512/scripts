#!/usr/bin/env bash

# DESCRIPTION
#   Kiosk machine based on Ubuntu 18.04.3 Desktop and Google chrome.
#   When installing Ubuntu, some user (let it be 'admkiosk') was created with
#   sudoers privileges. Run this script under this user.

# TODO
#   - disable screensaver and screenlock (though currently can done by 'xdotool keydown ctrl; xdotool keyup ctrl' in a loop)
#   - remove guest user

# REFERENCE
#   https://askubuntu.com/questions/860214/kiosk-with-chrome-on-16-04
#   https://obrienlabs.net/setup-kiosk-ubuntu-chromium
#   https://tutorials.ubuntu.com/tutorial/secure-ubuntu-kiosk#0
#   https://www.instructables.com/id/Setting-Up-Ubuntu-as-a-Kiosk-Web-Appliance/

# Second user (kiosk), less privileged, will be created. His name/password:
KIOSK_USER=kiosk
KIOSK_USER_PASS="kiosk"

clear; clear
set -x; set -e; date
### Install Required Packages
sudo apt update
sudo apt-get install -y chromium-browser unclutter xdotool openssh-server net-tools

### Create user kiosk, not in sudoers group.
# if [ 1 = 1 ];then # remove user (during experimenting)
#     sudo killall --user $KIOSK_USER -r || echo "Could not kill all precesses of $KIOSK_USER user"
#     sleep 1s
#     sudo userdel $KIOSK_USER -r || echo "Could not remove $KIOSK_USER user"
#     sudo groupdel $KIOSK_USER   || echo "Could not remove $KIOSK_USER group"
#     sleep 1s
# fi
getent group $KIOSK_USER || (
    sudo su -c "groupadd $KIOSK_USER" # add group kiosk
    sudo su -c "useradd $KIOSK_USER -K PASS_MAX_DAYS=-1 -s /bin/bash -m -g $KIOSK_USER -p $(openssl passwd -1 \"$KIOSK_USER_PASS\")" # Add kiosk user,
    # no password by default, but system will ask to set up new one.

    # sudo su -c "useradd $KIOSK_USER -K PASS_MAX_DAYS=-1 -s /bin/bash -m -g $KIOSK_USER -p $(openssl passwd -1 \"$KIOSK_USER_PASS\")" # Add kiosk user,

    ### Adding password for kiosk user, and it will be asked after each login. Probably same as useradd --password option.
    # sudo usermod -p $(openssl passwd -1 "$KIOSK_USER_PASS") $KIOSK_USER # set kiosk user password

    ### Turning off password asking for kiosk user (not working)
    # f=/etc/sudoers ### in better world, run visudo
    # if [ ! -f $f.old ];then sudo cp $f $f.old; fi
    # sudo sh -c "echo \"kiosk ALL=NOPASSWD: ALL\" >> $f"

    #http://ubuntuhandbook.org/index.php/2019/02/enable-passwordless-login-ubuntu-18-04/
    sudo su -c "groupadd nopasswdlogin" || echo "Could not create group nopasswdlogin" ## create group
    sudo usermod -a -G nopasswdlogin $KIOSK_USER ## add user to group
    f=/etc/pam.d/gdm-password
    # auth sufficient pam_succeed_if.so user ingroup nopasswdlogin
    if [ ! -f $f.old ];then sudo cp $f $f.old; fi ### Save old version of the file, if not done already.
    sudo su -c "echo \"auth sufficient pam_succeed_if.so user ingroup nopasswdlogin\" > $f"
    sudo su -c "cat $f.old >> $f"
)



### Install and start ssh
# sudo apt-get install -y openssh-server
# sudo ufw allow ssh # open ssh port, if firewall is enabled in Ubuntu
### Now admkiosk will be able to ssh to the machine by its IP, for administering purposes.
### For example, reboot command: sudo systemctl reboot -i
### To know IP (inet addr) and MAC (HWaddr), run 'ip a' or ifconfig
# sudo apt install -y net-tools ### install ifconfig


### Setup Auto Login, way 1
sudo rm -f /etc/lightdm/lightdm.conf /usr/share/lightdm/lightdm.conf.d/99-kiosk.conf ### revert
# # See LightDM "help" in: /usr/share/doc/lightdm/lightdm.conf.gz
# sudo bash -c 'cat > /usr/share/lightdm/lightdm.conf.d/99-kiosk.conf' << EOF
# [Seat:*]
# user-session=kiosk
# EOF
# # Setting below options in only 99-kiosk.conf doesn't seem enough (conflicts on autologin-user).
# sudo mkdir -p /etc/lightdm
# sudo bash -c 'cat > /etc/lightdm/lightdm.conf' << EOF
# [Seat:*]
# autologin-guest=false
# autologin-user=kiosk
# autologin-user-timeout=0
# EOF


### Setup Auto Login, way 2
f=/etc/gdm3/custom.conf
if [ ! -f $f.old ];then sudo cp $f $f.old; fi ### Save old version of the file, if not done already.
if [   -f $f.old ];then sudo cp $f.old $f; fi ### Return back to old version.
sudo su -c "cat > $f" << EOF
[daemon]
# Uncoment the line below to force the login screen to use Xorg
#WaylandEnable=false
AutomaticLoginEnable = true
EOF
sudo su -c "echo \"AutomaticLogin = $KIOSK_USER\" >> $f"


### Copy kiosk script, that will be run under kiosk user, to his home
f=/home/$KIOSK_USER/kioskfile.sh
sudo su -c "cp ./kioskfile.sh $f"
sudo chmod +x $f

### Add kioskfile.sh to startup script, way 1
# ### (but this will run in any user session?)
# f=/home/$KIOSK_USER/.profile; grep "/home/$KIOSK_USER/kioskfile.sh" $f \
#     || sudo bash -c "echo >> $f; echo \"/home/$KIOSK_USER/kioskfile.sh\" >> $f"


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
EOF
sudo bash -c "echo \"Exec=/home/$KIOSK_USER/kioskfile.sh\" >> $f"



echo Ok

### And reboot
sudo systemctl reboot -i
