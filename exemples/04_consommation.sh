#!/usr/bin/env bash
# État de la clé : consommation, plafond, palier gratuit. La clé est lue dans ../.env, jamais affichée.
set -euo pipefail
cd "$(dirname "$0")/.."
set -a; . ./.env; set +a
curl -s https://openrouter.ai/api/v1/key -H "Authorization: Bearer $OPENROUTER_API_KEY" | python3 -c '
import json, sys
d = json.load(sys.stdin)["data"]
for k in ("limit", "limit_remaining", "usage", "usage_daily", "is_free_tier", "expires_at"):
    if k in d: print(f"{k:<16} {d[k]}")'
curl -s https://openrouter.ai/api/v1/credits -H "Authorization: Bearer $OPENROUTER_API_KEY" | python3 -c '
import json, sys
d = json.load(sys.stdin).get("data", {}); print("crédits achetés", d.get("total_credits"), "| dépensés", d.get("total_usage"))'
