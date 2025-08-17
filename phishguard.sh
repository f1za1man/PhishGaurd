#!/usr/bin/env bash
set -Eeuo pipefail

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"
LOG_DIR="$SCRIPT_DIR/logs"
mkdir -p "$LOG_DIR"

echo "=== Welcome to PhishGuard ==="
echo "1) Email Analysis"
echo "2) Website Inspection"
echo "3) Social Engineering Simulation"
echo "4) Quiz and Scoring"
echo "5) Exit"

read -rp "Choose an option [1-5]: " choice

case "${choice:-}" in
  1) bash "$SCRIPT_DIR/modules/email_analysis.sh" ;;
  2) bash "$SCRIPT_DIR/modules/website_inspection.sh" ;;
  3) bash "$SCRIPT_DIR/modules/social_engineering.sh" ;;
  4) bash "$SCRIPT_DIR/modules/quiz.sh" ;;
  5) echo "Exiting..."; exit 0 ;;
  *) echo "Invalid choice." ;;
esac
