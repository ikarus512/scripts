sudo apt update
#sudo apt install -y xfce4 xfce4-goodies tightvncserver
sudo apt install vnc4server xfce4 xfce4-goodies
sudo ufw allow from any to any port 5901 proto tcp
