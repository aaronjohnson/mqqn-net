#!/usr/bin/env bash
# Deploy public/ to $SITE, then check it answers. (The ship panel runs the same.)
set -euo pipefail
cd "$(dirname "$0")/.."; source ops/env.sh
$FIREBASE deploy --only "hosting:$SITE" --project "$PROJECT"
ops/06-check.sh
