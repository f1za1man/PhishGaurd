#!/usr/bin/env bash
set -Eeuo pipefail
SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"
ROOT_DIR="$(dirname "$SCRIPT_DIR")"
source "$ROOT_DIR/lib/scoring.sh"

score_init

# Example phishing email
SUBJECT="Urgent! Your Account Has Been Locked"
FROM="alerts@paypal-support.com"
LINK="http://paypal-support-secure.com/login"

echo "=== Email Analysis ==="
echo "Subject: $SUBJECT"
echo "From:    $FROM"
echo "Link:    $LINK"
echo ""

read -rp "Is the sender's domain suspicious? (yes/no): " domain_check
read -rp "Is the link legitimate? (yes/no): " link_check

if [[ "${domain_check,,}" == "yes" ]]; then score_add 5; fi
if [[ "${link_check,,}" == "no" ]]; then score_add 5; fi

if [[ "${domain_check,,}" == "yes" && "${link_check,,}" == "no" ]]; then
  echo "✅ Correct! The domain is spoofed and the link is fake."
else
  echo "❌ Incorrect. The email had red flags."
fi

echo "Score: $SCORE / 10"
score_save "email_analysis"
