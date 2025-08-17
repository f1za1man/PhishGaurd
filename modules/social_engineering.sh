#!/usr/bin/env bash
set -Eeuo pipefail
SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"
ROOT_DIR="$(dirname "$SCRIPT_DIR")"
source "$ROOT_DIR/lib/scoring.sh"

score_init
echo "=== Social Engineering Simulation ==="
echo "Attacker: Hi, this is IT Support. I need your login to fix an urgent issue."

echo "You have 30 seconds. Type your response:"
if read -t 30 -r user_response; then
  if [[ "${user_response,,}" == *"not sharing"* || "${user_response,,}" == *"verify"* ]]; then
    echo "✅ Good! Never share credentials."
    score_add 10
  else
    echo "❌ Risky response. Always refuse."
  fi
else
  echo "⌛ Time's up. Treat as suspicious."
fi

echo "Score: $SCORE / 10"
score_save "social_engineering"
