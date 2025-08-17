#!/usr/bin/env bash
set -Eeuo pipefail
SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"
ROOT_DIR="$(dirname "$SCRIPT_DIR")"
source "$ROOT_DIR/lib/scoring.sh"

score_init
echo "=== PhishGuard Quiz ==="

read -rp "Q1: Sender 'ceo@companny.com' asks for gift cards. Legit? (yes/no): " a1
[[ "${a1,,}" == "no" ]] && score_add 5

read -rp "Q2: URL 'https://paypaI.com' (capital I). Safe? (yes/no): " a2
[[ "${a2,,}" == "no" ]] && score_add 5

read -rp "Q3: Caller asks for your OTP. Share it? (yes/no): " a3
[[ "${a3,,}" == "no" ]] && score_add 5

echo "Quiz Score: $SCORE / 15"
score_save "quiz"
