# wewe
pass=pass
user=user
echo -n "$pass$user" | md5sum
md5pass=$(echo -n "$pass$user" | md5sum | perl -pe 's/(^\S+)\s.*$/$1/;')
psql "ALTER  USER $USERNAME WITH PASSWORD 'md5$md5pass';"
