# Variables used in constructing HTTPS request
host="www.espn.com"
port="443"
http_method="GET"
path="/golf/leaderboard/_/tournamentId/401243230"
headers="Host: $host\r\nConnection: close\r\n\r\n"
request="$http_method $path HTTP/1.1\r\n$headers"

# Execute the OpenSSL command and redirect the output to a file
openssl s_client -connect "$host:$port" -crlf <<< "$request" > response.txt
