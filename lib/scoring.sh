#!/usr/bin/env bash
SCORE_FILE="logs/scores.csv"
mkdir -p "$(dirname "$SCORE_FILE")"

score_init() {
  SCORE=0
  START_TS="$(date +%s)"
}

score_add() {
  local points="${1:-0}"
  SCORE=$((SCORE + points))
}

score_save() {
  local label="${1:-session}"
  local end_ts
  end_ts="$(date +%s)"
  local duration=$((end_ts - START_TS))
  if [[ ! -f "$SCORE_FILE" ]]; then
    echo "timestamp,module,score,duration_seconds" > "$SCORE_FILE"
  fi
  echo "$(date -Is),$label,$SCORE,$duration" >> "$SCORE_FILE"
  echo "Saved score to $SCORE_FILE"
}
