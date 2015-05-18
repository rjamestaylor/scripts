#!/bin/sh
URL=`echo "$1" | sed -e 's|^https://||'`
PORT=":$2"

[ -z "$2" ] && PORT=""

echo "Checking $URL$PORT..."
echo | openssl s_client -connect $URL$PORT 2>/dev/null | openssl x509 -noout -dates
