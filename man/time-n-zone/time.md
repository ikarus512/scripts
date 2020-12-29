# NTP setver
sudo apt install -y ntp
sntp --version

# Check time on NTP server
curl -v --insecure --silent https://google.com 2>&1 | grep -i "< date:"
curl -v --insecure --silent 127.0.0.1          2>&1 | grep -i "< date:"

# Check NTP server's local time
sudo apt install -y ntpdate
ntpdate -d -p 1 https://google.com | grep "reference time"
ntpdate -d -p 1 127.0.0.1          | grep "reference time"

# Set time zone
timedatectl      # show current local timezone
timedatectl list-timezones | grep Moscow
sudo timedatectl set-timezone Europe/Moscow   # set local timezone
