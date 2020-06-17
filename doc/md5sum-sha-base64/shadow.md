
user=user
pass=pass
salt=salt
sudo apt-get install whois # mkpasswd

cat /etc/shadow | grep $user    # passwd format here is   $6$salt$hash
mkpasswd -m sha-512 $pass $salt # to emulate it and get same hash
