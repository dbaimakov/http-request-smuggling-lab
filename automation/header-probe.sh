#!/usr/bin/env bash
# Usage: ./header-probe.sh example.com 443
set -euo pipefail
HOST="${1:-}"; PORT="${2:-443}"
[ -z "$HOST" ] && { echo "Usage: $0 <host> [port]"; exit 1; }

echo "[i] Probing $HOST:$PORT for CL/TE behavior (no exploitation)"
REQ=$'POST / HTTP/1.1\r\nHost: '"$HOST"$'\r\nContent-Length: 6\r\nTransfer-Encoding: chunked\r\nContent-Type: application/x-www-form-urlencoded\r\n\r\n0\r\n\r\nX=1'
printf "%b" "$REQ" | openssl s_client -quiet -connect "$HOST:$PORT" 2>/dev/null | sed -n '1,20p'
echo
echo "[tip] If the edge rejects the request, good. If it accepts, review edge normalization & HTTP/2 e2e."
