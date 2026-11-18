#!/usr/bin/env bash
# Liste les modèles gratuits (prix 0 en entrée et en sortie) avec leur contexte. Sans clé : la liste est publique.
set -euo pipefail
curl -s https://openrouter.ai/api/v1/models > /tmp/openrouter-modeles.json
python3 - /tmp/openrouter-modeles.json <<'PY'
import json, sys
donnees = json.load(open(sys.argv[1]))["data"]
gratuits = [x for x in donnees if float(x["pricing"]["prompt"]) == 0 and float(x["pricing"]["completion"]) == 0]
for x in sorted(gratuits, key=lambda x: x["id"]):
    ctx = x.get("context_length") or 0
    print(f"{x['id']:<55} contexte {ctx:>9}")
print(len(gratuits), "modèles gratuits sur", len(donnees))
PY
