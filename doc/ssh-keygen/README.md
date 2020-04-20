# ssh-keygen best practices 2020

Example to generate ssh-ed25519 key:
keyfile=~/.ssh/keyname
user=user
host=host
passphrase=passphrase
#f=./ask_pass.sh
#setsid=setsid
#export DISPLAY=:
#export ASK_PASS=$f
#SSH_OPTIONS="-oLogLevel=error -oStrictHostKeyChecking=no  -oUserKnownHostsFile=/dev/null -v"
ssh-keygen -t ed25519 -a 100   -f $keyfile -N '' # empty passprase
ssh-copy-id -i $keyfile $user@$host
puttygen $keyfile -o $keyfile.ppk    # save private key for PuTTY
#echo -n "#" >$f; echo -n "!" >>$f; echo "/usr/bin/env bash" >>$f; echo "echo $passphrase" >>$f; chmod 777 $f
#echo foo | $setsid ssh $SSH_OPTIONS -i $keyfile $user@$host "who"
ssh -i $keyfile $user@$host "who"


More details:
## 1) ssh-ed25519 (complexity ~ rsa 4096 bits, but shorter), OpenSSH 6.5+
ssh-keygen -t ed25519 -a 100

## 2) rsa 4096 bits (-o option requires OpenSSH 6.5+, but disappeared in OpenSSH 7.8+ because in on by default)
ssh-keygen -t rsa -b 4096 -o -a 100

## 3) dsa is insecure


## Other
Search on "ssh-keygen best practices 2020"
2020: https://www.liquidweb.com/kb/top-15-server-security-practices-for-2020
2016: https://security.stackexchange.com/questions/143442/what-are-ssh-keygen-best-practices
OpenSSH versions:
  8.1 (Windows git 2020)
  7.6 (Ubuntu 18 LTS 2017)
  ?.? PuTTY (sudo apt install putty-tools)
