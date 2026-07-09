#!/usr/bin/env bash
#
# Prints how far the Wacken ticket bar has filled, in percent.
#
#   sold-out-progress.sh          -> 15.1
#   sold-out-progress.sh --raw    -> 0.151
#
set -euo pipefail

URL="https://www.wacken.com/"
UA="Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0 Safari/537.36"

raw=false
if [[ "${1:-}" == "--raw" ]]; then
  raw=true
fi

html=$(curl -fsSL --max-time 20 -A "$UA" "$URL") || {
  echo "sold-out-progress: could not fetch $URL" >&2
  exit 1
}

# The bar is an SVG image clipped by a rect whose width is the sold fraction:
#   <clipPath id="clippath-ticket-status-bar" clipPathUnits="objectBoundingBox">
#     <rect x="0" y="0" width="0.151" height="1">
flat=$(printf '%s' "$html" | tr '\n' ' ')

if [[ "$flat" != *'id="clippath-ticket-status-bar"'* ]]; then
  echo "sold-out-progress: ticket bar not on the page anymore" >&2
  exit 2
fi

fraction=$(printf '%s' "$flat" \
  | sed -E 's/.*id="clippath-ticket-status-bar"//' \
  | grep -oE '<rect[^>]*width="[0-9.]+"' \
  | head -1 \
  | sed -E 's/.*width="([0-9.]+)".*/\1/')

if [[ -z "$fraction" ]]; then
  echo "sold-out-progress: clip rect not found, page markup probably changed" >&2
  exit 3
fi

if $raw; then
  printf '%s\n' "$fraction"
else
  awk -v f="$fraction" 'BEGIN { printf "%.1f\n", f * 100 }'
fi
