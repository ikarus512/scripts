# HTTP digest/basic auth
user=user
pass=pass
encoded=$(echo -n "$user:$pass" | base64); echo encoded=$encoded
auth_header="Authorization: Basic $encoded"
curl -X GET -H "$auth_header" --silent -L http://$host/$path

decoded=$(echo -n "$encoded" | base64 -d); echo decoded=$decoded
