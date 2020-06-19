Nice one-liner to remove sudo prompts for the current user
sudo bash -c 'echo "$(logname) ALL=(ALL:ALL) NOPASSWD: ALL" | (EDITOR="tee -a" visudo)'


Another one-liner:
sudo sed -i /etc/sudoers -re 's/^%sudo.*/%sudo   ALL=(ALL:ALL) NOPASSWD: ALL/g'
