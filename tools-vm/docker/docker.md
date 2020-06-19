# docker
# https://docs.docker.com/engine/install/ubuntu/ (2020, ubuntu 16,18,19)
# https://docs.docker.com/install/linux/docker-ce/ubuntu

## SET UP THE REPOSITORY
### uninstall old dockers
sudo apt-get remove docker docker-engine docker.io containerd runc
### update, allow apt to use a repository over HTTPS
sudo apt update; sudo apt-get install -y apt-transport-https ca-certificates curl gnupg-agent software-properties-common
### add Docker’s official GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
### verify the key
sudo apt-key fingerprint 0EBFCD88 2>&1 | grep "9DC8 5822 9FC7 DD38 854A  E2D8 8D81 803C 0EBF CD88"
### set up the stable repository
v=$(lsb_release -cs); echo v=$v; sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $v stable"

## INSTALL DOCKER ENGINE
### update, install recent version
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io -y
### list the available versions, install specific version
#apt-cache madison docker-ce | grep $v
#sudo apt-get install docker-ce=VERSION_STRING docker-ce-cli=VERSION_STRING containerd.io


## VERIFY
sudo docker run hello-world
