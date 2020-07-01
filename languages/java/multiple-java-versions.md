
sudo apt install -y openjdk-11-jdk openjdk-11-jre openjdk-8-jdk openjdk-8-jre update-alternatives

 update-java-alternatives --list    ## result:
 ## java-1.11.0-openjdk-amd64      1111       /usr/lib/jvm/java-1.11.0-openjdk-amd64
 ## java-1.8.0-openjdk-amd64       1081       /usr/lib/jvm/java-1.8.0-openjdk-amd64

sudo update-java-alternatives --set /usr/lib/jvm/java-1.11.0-openjdk-amd64
sudo update-java-alternatives --set /usr/lib/jvm/java-1.8.0-openjdk-amd64

sudo apt remove -y  openjdk-11-jdk openjdk-11-jre openjdk-8-jdk openjdk-8-jre
sudo apt install -y openjdk-11-jdk openjdk-11-jre
sudo apt install -y openjdk-8-jdk  openjdk-8-jre
java -version
