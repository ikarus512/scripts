#sudo apt update
#sudo apt install -y openssh-server

#wget http://adminguide.ru/wp-content/uploads/2018/11/install-xrdp-2.2.zip
#unzip ./install-xrdp-2.2.zip
#chmod +x ./Install-xrdp-2.2.sh
#./Install-xrdp-2.2.sh -g yes

sudo apt install -y xrdp
sudo systemctl enable xrdp
