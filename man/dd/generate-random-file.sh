# openssl rand -out sample.txt -base64 $(( 2**30 * 3/4 ))
dd if=/dev/urandom of=sample.txt bs=1G count=1
