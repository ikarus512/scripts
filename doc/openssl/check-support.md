# Testing server for TLS 1.2
https://devanswers.co/test-server-tls-1-2-ubuntu/

## using openssl
openssl s_client -connect google.com:443 -tls1_2

## using nmap
nmap --script ssl-enum-ciphers -p 443 www.google.com

## Testing an Accepted cipher
openssl s_client -cipher 'ECDHE-RSA-AES256-SHA' -connect google.com:443
