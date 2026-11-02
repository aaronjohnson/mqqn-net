# Shared settings for the ops/ scripts. Sourced, not run.
PROJECT=mqqn-net                 # Firebase / Google Cloud project (shared with the other sites)
SITE=mqqn-net                    # Firebase Hosting site for this one
DOMAIN=mqqn.net
FIREBASE=$(command -v firebase || echo "nix run nixpkgs#firebase-tools --")   # never npx: it runs whatever npm serves

die() { echo "error: $*" >&2; exit 1; }
need() { command -v "$1" >/dev/null || die "$1 not found"; }

# Log each run to ops/logs/<UTC time>-<script>.log as well as the terminal (git-ignored).
if [[ -z ${NOLOG:-} ]]; then
  LOG_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/logs"
  mkdir -p "$LOG_DIR"
  LOG="$LOG_DIR/$(date -u +%Y%m%dT%H%M%SZ)-$(basename "$0" .sh).log"
  exec > >(tee -a "$LOG") 2>&1
  echo "# $(date -Is) $0 $*"
fi
