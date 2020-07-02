


sudo apt install -y openjdk-11-jdk openjdk-11-jre openjdk-8-jdk openjdk-8-jre     pngquant  # update-java-alternatives
sudo apt install -y update-java-alternatives update-alternatives



update-java-alternatives --list    ## result:
  ## java-1.11.0-openjdk-amd64      1111       /usr/lib/jvm/java-1.11.0-openjdk-amd64
  ## java-1.8.0-openjdk-amd64       1081       /usr/lib/jvm/java-1.8.0-openjdk-amd64
sudo update-java-alternatives --set /usr/lib/jvm/java-1.11.0-openjdk-amd64
sudo update-java-alternatives --set /usr/lib/jvm/java-1.8.0-openjdk-amd64
sudo update-alternatives --config java




sudo apt remove -y  openjdk-11-jdk openjdk-11-jre openjdk-8-jdk openjdk-8-jre

sudo apt remove  -y openjdk-8-jdk openjdk-8-jre  ; sudo apt autoremove -y; sudo apt update; java -version
sudo apt remove  -y openjdk-11-jdk openjdk-11-jre; sudo apt autoremove -y; sudo apt update; java -version
sudo apt remove -y ant
sudo apt update
sudo apt install -y openjdk-8-jdk  openjdk-8-jre ; java -version
sudo apt install -y openjdk-11-jdk openjdk-11-jre; java -version
sudo apt install -y ant update-java-alternatives



#https://www.thegeekdiary.com/how-to-work-with-multiple-java-versions-under-linux/
#https://dev.to/thegroo/install-and-manage-multiple-java-versions-on-linux-using-alternatives-5e93
