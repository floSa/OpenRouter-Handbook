#!/usr/bin/env bash
# Premier appel : une question à un modèle gratuit. La clé est lue dans ../.env, jamais affichée.
set -euo pipefail
cd "$(dirname "$0")/.."
set -a; . ./.env; set +a
MODELE="${1:-inclusionai/ling-3.2-flash:free}"
curl -s https://openrouter.ai/api/v1/chat/completions \
  -H "Authorization: Bearer $OPENROUTER_API_KEY" -H "Content-Type: application/json" \
  -d "{\"model\": \"$MODELE\", \"messages\": [{\"role\": \"user\", \"content\": \"En une phrase : qu'est-ce qu'OpenRouter ?\"}]}" |
python3 -c '
import json, sys
r = json.load(sys.stdin)
if "error" in r: sys.exit("erreur : " + json.dumps(r["error"], ensure_ascii=False))
print("modèle :", r["model"], "| fournisseur :", r.get("provider"))
print("réponse :", r["choices"][0]["message"]["content"].strip())
u = r.get("usage", {}); print("jetons : entrée", u.get("prompt_tokens"), "| sortie", u.get("completion_tokens"), "| coût", u.get("cost"))'
