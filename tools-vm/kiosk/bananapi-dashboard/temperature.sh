#

#http://wiki.lemaker.org/How_to_read_the_CPU%26PMU_temperature
#sudo apt update; sudo apt install lm-sensors; ./reboot.sh
#sudo sensors-detect

while [ true ];do echo -ne "$(sudo sensors | grep temp)  "\\r; sleep 5s; done
