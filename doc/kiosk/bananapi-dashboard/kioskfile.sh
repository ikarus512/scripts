#!/usr/bin/env bash

sleep 1s

timestamp=$(perl -e 'my ($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst) = localtime(time);    printf("%04d%02d%02d_%02d%02d%02d", $year+1900,$mon+1,$mday,$hour,$min,$sec);')
#logfile=/dev/null
logfile=~/$timestamp.log
# script $logfile ### copy the session output to the log file (does not work here)

set -x ### dump commands
# set -e ### exit on errors
date    >>$logfile 2>&1


### Run this script in display 0 - the monitor
# export DISPLAY=:0
export DISPLAY=:0.0



### Disable keyboard and mouse ### https://ubuntuforums.org/showthread.php?t=1663298
#for id in $(xinput|perl -e 'while(<STDIN>) {if(m/id=(\d+)\s+.*slave\s+(keyboard|pointer)/) {print " $1";}}');do
#    echo "xinput float $id"     >>$logfile 2>&1
#    xinput float $id            >>$logfile 2>&1
#done



# Hide the mouse from the display
#unclutter &

### If Chromium crashes (usually due to rebooting), clear the crash flag so we dont have the annoying warning bar
sed -i 's/"exited_cleanly":false/"exited_cleanly":true/' /home/$USER/.config/chromium/Default/Preferences
sed -i 's/"exit_type":"Crashed"/"exit_type":"Normal"/' /home/$USER/.config/chromium/Default/Preferences

### make chromium default browser
#update-alternatives --set x-www-browser /usr/bin/chromium-browser          >>$logfile 2>&1






# ### KIOSK EXAMPLE 1:
# ### Run Chromium, open 2 tabs, and generate pressing of <ctrl>+<Tab> in a loop
# opts=
# opts="$opts --password-store=basic" ### this prevents chrome to create new keyring interactively
# /usr/bin/chromium-browser $opts --window-size=1920,1080 --kiosk --window-position=0,0 http://google.com http://bing.com &
# # Start the kiosk loop. This keystroke changes the Chromium tab
# while (true);do
#     xdotool keydown ctrl+Tab; xdotool keyup ctrl+Tab;
#     sleep 3
# done




### KIOSK EXAMPLE 2:
### Run Chromium, open youtube, and play single video file in a loop
#opts=
#opts="$opts --password-store=basic" ### this prevents chrome to create new keyring interactively
## https://developers.google.com/youtube/player_parameters
#VIDEO_ID=LTTsy6uuzVs
#url="https://www.youtube.com/watch?v=$VIDEO_ID&autoplay=1&playlist=$VIDEO_ID&loop=1"
#/usr/bin/chromium-browser $opts --window-size=1920,1080 --kiosk --window-position=0,0 $url  >>$logfile 2>&1 &
#sleep 20s; xdotool key space     >>$logfile 2>&1  ### autoplay by pressing space key
#sleep  2s; xdotool key f         >>$logfile 2>&1  ### fullscreen by pressing f
## Start the kiosk loop. This is just anti-idle
#while (true);do xdotool keydown ctrl; xdotool keyup ctrl; sleep 30s; done


#xfce4-terminal --command="bash -c 'sleep 1s; ip address show'" --hold
/usr/bin/chromium-browser $opts --window-size=1024,768 --kiosk --window-position=0,0 https://jira.yourcompany.com/plugins/servlet/Wallboard/?dashboardId=12345 &
