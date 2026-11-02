#!/usr/bin/env bash
# Read-only: the status of this site's pages, and of every *.mqqn.net link in public/.
# Exits non-zero if any of them is down, so a dead link gets noticed.
set -uo pipefail
cd "$(dirname "$0")/.."; source ops/env.sh
need curl
failed=0
for url in "https://$DOMAIN/" "https://$DOMAIN/about" "https://$DOMAIN/colophon" \
           $(grep -roh 'https://[a-zA-Z0-9._-]*\.mqqn\.net' public/ | sort -u); do
  status=$(curl -o /dev/null -s -w '%{http_code}' --max-time 10 "$url") || status=000
  printf '%s %s\n' "$status" "$url"
  [[ $status == [23]* ]] || failed=1
done
exit $failed
