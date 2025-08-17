#!/usr/bin/env bash
set -Eeuo pipefail
SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"
ROOT_DIR="$(dirname "$SCRIPT_DIR")"
source "$ROOT_DIR/lib/scoring.sh"

score_init

echo "=== Website Inspection ==="
read -rp "Enter a URL to inspect (e.g., https://example.com): " url

proto="$(echo "$url" | sed -nE 's#^(https?)://.*#\1#p')"
host="$(echo "$url" | sed -E 's#^https?://##' | cut -d/ -f1)"

if [[ "$proto" == "https" ]]; then
  echo "[*] HTTPS detected."
  score_add 3
else
  echo "[!] Not using HTTPS."
fi

echo "[*] Fetching headers..."
curl -sI "$url" | head -n 5 || true

echo "[*] Checking certificate..."
if [[ -n "$host" ]]; then
  echo | openssl s_client -servername "$host" -connect "$host:443" 2>/dev/null | openssl x509 -noout -dates -issuer -subject || true
fi

read -rp "Does the URL look legitimate? (yes/no): " url_check
read -rp "Is SSL/TLS properly set up? (yes/no): " ssl_check

if [[ "${url_check,,}" == "no" ]]; then score_add 4; fi
if [[ "${ssl_check,,}" == "no" ]]; then score_add 3; else score_add 1; fi

echo "Score: $SCORE / 10"
score_save "website_inspection"
