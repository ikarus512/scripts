
#https://www.cyberciti.biz/faq/ubuntu-linux-install-openssh-server/
sudo apt install -y openssh-server
sudo systemctl enable ssh
sudo systemctl start ssh

### Ubuntu firewall:
#sudo ufw allow ssh
#sudo ufw enable
#sudo ufw status
