# Step 1
sudo apt update
sudo apt install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
ubuntu_version=bionic # Ubuntu 18.0
 #ubuntu_version=focal # Ubuntu 20.0
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $ubuntu_version stable"
sudo apt update
apt-cache policy docker-ce
 # Make sure you are about to install from the Docker repo instead of the default Ubuntu repo
 # Notice the following:
 #  docker-ce:
 #    Installed: (none)                       # currently not installed
 #    Candidate: 18.03.1~ce~3-0~ubuntu        # from correct repo (bionic for Ubuntu 18)
## install
sudo apt install docker-ce
## check
sudo systemctl status docker






# Step 2 - Executing the Docker Command Without Sudo (Optional)
sudo usermod -aG docker ${USER}
su - ${USER}     # or exit and then login back
id -nG    # to check if you nw in docker group too



# Step 3 - Run docker
docker          # show available commands
docker images   # show downloaded images
docker ps       # show running containers
docker ps -a    # show all containers

docker start <container-ID>
docker stop  <container-ID>
docker rm    <container-ID>
