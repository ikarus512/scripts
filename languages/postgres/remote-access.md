# remote access to postgresql on Ubuntu
 cat $(sudo find /etc -name postgresql.conf) | grep listen_addresses
 telnet -l postgres 192.168.xxx.xxx 5432


 sudo echo "listen_addresses = '*'" >>$(sudo find /etc -name postgresql.conf)
 sudo echo "host all all 192.168.xxx.xxx/32 md5" >> $(sudo find /etc -name pg_hba.conf)

 ###sudo service postgresql restart ### this does not work

 sudo mcedit $(sudo find /etc -name postgresql.conf); sudo systemctl restart postgresql
 sudo mcedit $(sudo find /etc -name pg_hba.conf); sudo systemctl restart postgresql
 sudo ufw allow 5432/tcp



host samerole all 203.0.113.2/32 md5
192.168.xxx.x/32 is the remote IP from which connection is allowed
0.0.0.0/0 If you want to allow connection from any IP
md5 is the authentication method, which requires the client to supply a double-MD5-hashed password for authentication




# https://www.postgresql.org/docs/9.6/auth-pg-hba-conf.html
local      database  user  auth-method  [auth-options]
host       database  user  address  auth-method  [auth-options]
hostssl    database  user  address  auth-method  [auth-options]
hostnossl  database  user  address  auth-method  [auth-options]
host       database  user  IP-address  IP-mask  auth-method  [auth-options]
hostssl    database  user  IP-address  IP-mask  auth-method  [auth-options]
hostnossl  database  user  IP-address  IP-mask  auth-method  [auth-options]

auth-method:
trust    Allow the connection unconditionally. This method allows anyone that can connect to the PostgreSQL database server to login as any PostgreSQL user they wish, without the need for a password or any other authentication. See Section 20.3.1 for details.
reject   Reject the connection unconditionally. This is useful for "filtering out" certain hosts from a group, for example a reject line could block a specific host from connecting, while a later line allows the remaining hosts in a specific network to connect.
md5      Require the client to supply a double-MD5-hashed password for authentication. See Section 20.3.2 for details.
password Require the client to supply an unencrypted password for authentication. Since the password is sent in clear text over the network, this should not be used on untrusted networks. See Section 20.3.2 for details.
gss      Use GSSAPI to authenticate the user. This is only available for TCP/IP connections. See Section 20.3.3 for details.
sspi     Use SSPI to authenticate the user. This is only available on Windows. See Section 20.3.4 for details.
ident    Obtain the operating system user name of the client by contacting the ident server on the client and check if it matches the requested database user name. Ident authentication can only be used on TCP/IP connections. When specified for local connections, peer authentication will be used instead. See Section 20.3.5 for details.
peer     Obtain the client's operating system user name from the operating system and check if it matches the requested database user name. This is only available for local connections. See Section 20.3.6 for details.
ldap     Authenticate using an LDAP server. See Section 20.3.7 for details.
radius   Authenticate using a RADIUS server. See Section 20.3.8 for details.
cert     Authenticate using SSL client certificates. See Section 20.3.9 for details.
pam      Authenticate using the Pluggable Authentication Modules (PAM) service provided by the operating system. See Section 20.3.10 for details.
bsd      Authenticate using the BSD Authentication service provided by the operating system. See Section 20.3.11 for details.
