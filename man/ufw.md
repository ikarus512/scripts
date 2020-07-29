# ufw
 sudo apt install -y ufw

# list rules
 sudo ufw status

# allow
 sudo ufw allow from 192.168.0.1 to any port 22

# deny
 sudo ufw deny <port>/<optional: protocol>
 sudo ufw deny mysql

# restart ufw
 sudo ufw disable; sudo ufw reload; sudo ufw enable

# delete rules
 sudo ufw delete [number]
 where [number] is from first column of sudo ufw status

# reset rule list to default ones
 sudo ufw reset

# enable ipv6
sudo echo "IPV6=yes" >>/etc/default/ufw
