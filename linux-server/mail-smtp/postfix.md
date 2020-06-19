# Postfix
 #https://help.ubuntu.com/community/Postfix
 #https://superuser.com/questions/742961/postfix-allows-unauthenticated-users-to-send-emails
 #https://serverfault.com/questions/805140/cant-connect-to-a-postfix-server-though-port-25-is-open
 #dos2unix postfix.md
 #clear;clear;chmod 777 postfix.md; ./postfix.md




## 4. In order to use port 587 instead of 25:
 #sudo mcedit /etc/postfix/master.cf # and uncomment line:
 #   # submission inet n      -       n       -       -       smtpd
 #sudo systemctl restart saslauthd postfix
 #sudo /etc/init.d/saslauthd start
 #sleep 2s
 #sudo systemctl | grep -P "sasl|postfix"

## 4.2 only allow authenticated smtp
...


## 5. Test
 #sudo nmap -sT -O localhost | grep -P "open|closed"
 #postconf -n
 #postconf -M
 #sudo iptables -L
 #netstat -antp

 test_ports="25 468 587"
 for p in $test_ports; do echo "### trying $p..."; (sleep 3s;) | telnet localhost $p; echo; done
exit
  sudo adduser m    # create user
  sudo passwd m     # change password







## 1. Installation
 sudo apt-get install -y postfix # choose No configuration

## 2. Configuration
  sudo mcedit /etc/ssl/openssl.cnf # and comment out RANDFILE=... lines (not necessary anymore in the openssl 1.1.1 random generator)
  sudo dpkg-reconfigure postfix    # and choose:
    # General type of mail configuration: Internet Site
    # NONE doesn't appear to be requested in current config
    # System mail name: example.com
    # Root and postmaster mail recipient: admin_user_name
    # Other destinations for mail: server1.example.com, example.com, localhost.example.com, localhost
    #  # $myhostname, example.com, localhost.localdomain, localhost, server1.example.com. localhost.example.com
    # Force synchronous updates on mail queue?: No
    # Local networks: 127.0.0.0/8
    #  # Local networks: 127.0.0.0/8 [::ffff:127.0.0.0]/104 [::1]/128
    # Yes doesn't appear to be requested in current config
    # Mailbox size limit (bytes): 0
    # Local address extension character: +
    # Internet protocols to use: all
  sudo postconf -e 'home_mailbox = Maildir/'
  sudo postconf -e 'mailbox_command ='

  sudo postconf -e 'smtpd_sasl_local_domain ='
  sudo postconf -e 'smtpd_sasl_auth_enable = yes'
  sudo postconf -e 'smtpd_sasl_security_options = noanonymous'
  sudo postconf -e 'broken_sasl_auth_clients = yes'
  sudo postconf -e 'smtpd_recipient_restrictions = permit_sasl_authenticated,permit_mynetworks,reject_unauth_destination'
  sudo postconf -e 'inet_interfaces = all'

  sudo mcedit /etc/postfix/sasl/smtpd.conf # and add:
    pwcheck_method: saslauthd
    mech_list: plain login


  rm -fr smtpd.key smtpd.crt cakey.pem cacert.pem
  ls
  touch smtpd.key
  chmod 600 smtpd.key
  openssl genrsa 1024 > smtpd.key
  openssl req -new -key smtpd.key -x509 -days 3650 -out smtpd.crt                       -subj "/C=AU/ST=State/L=City/O=Org name/OU=Org unit/CN=yourame"
  export pphrase=1; openssl req -new -x509 -extensions v3_ca -keyout cakey.pem -out cacert.pem -days 3650 -subj "/C=AU/ST=State/L=City/O=Org name/OU=Org unit/CN=yourame" -passin env:pphrase -passout env:pphrase
  sudo mv smtpd.key /etc/ssl/private/
  sudo mv smtpd.crt /etc/ssl/certs/
  sudo mv cakey.pem /etc/ssl/private/
  sudo mv cacert.pem /etc/ssl/certs/

  sudo postconf -e 'smtp_tls_security_level = may'
  sudo postconf -e 'smtpd_tls_security_level = may'
  sudo postconf -e 'smtpd_tls_auth_only = no'
  sudo postconf -e 'smtp_tls_note_starttls_offer = yes'
  sudo postconf -e 'smtpd_tls_key_file = /etc/ssl/private/smtpd.key'
  sudo postconf -e 'smtpd_tls_cert_file = /etc/ssl/certs/smtpd.crt'
  sudo postconf -e 'smtpd_tls_CAfile = /etc/ssl/certs/cacert.pem'
  sudo postconf -e 'smtpd_tls_loglevel = 1'
  sudo postconf -e 'smtpd_tls_received_header = yes'
  sudo postconf -e 'smtpd_tls_session_cache_timeout = 3600s'
  sudo postconf -e 'tls_random_source = dev:/dev/urandom'
  sudo postconf -e 'myhostname = server1.example.com' # remember to change this to yours

  sudo /etc/init.d/postfix restart


## 3. Authentication
sudo apt install -y libsasl2-2 sasl2-bin libsasl2-modules

sudo cp /etc/default/saslauthd .
sudo chmod 777 ./saslauthd
sudo chown $USER ./saslauthd
mcedit ./saslauthd # and ensure lines:
  # START=yes
  # PWDIR="/var/spool/postfix/var/run/saslauthd"
  # PARAMS="-m ${PWDIR}"
  # PIDFILE="${PWDIR}/saslauthd.pid"
  # MECHANISMS="shadow" # only local users
  # OPTIONS="-c -m /var/spool/postfix/var/run/saslauthd"
sudo cp ./saslauthd /etc/default/
sudo chmod 644 /etc/default/saslauthd

sudo dpkg-statoverride --force --update --add root sasl 755 /var/spool/postfix/var/run/saslauthd  # and ignore "does not exist"
sudo ln -s /etc/default/saslauthd /etc/saslauthd

sudo /etc/init.d/saslauthd start
