#!/usr/bin/env bash


#rm /etc/armbianmonitor/datasources/soctemp
#ln -s /sys/devices/virtual/thermal/thermal_zone1/temp /etc/armbianmonitor/datasources/soctemp


#ls -l /etc/armbianmonitor/datasources/soctemp
#echo --
#sudo cat /etc/armbianmonitor/datasources/soctemp
#sudo cat /sys/devices/virtual/thermal/thermal_zone0/temp
#sudo cat /sys/devices/virtual/thermal/thermal_zone1/temp

sudo armbianmonitor -M
