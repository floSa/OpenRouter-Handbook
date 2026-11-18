# 07. Appeler un modèle par l'API

> **Point de départ** : clé dans `.env` (chapitre 03). **Résultat** : un programme qui interroge un modèle gratuit.

L'API d'OpenRouter suit le format d'OpenAI. Trois réglages suffisent :

| Réglage | Valeur |
|---|---|
| Adresse | `https://openrouter.ai/api/v1` |
| Clé | en-tête `Authorization: Bearer <clé>` |
| Modèle | identifiant copié de la fiche, par exemple `inclusionai/ling-3.2-flash:free` |

**Étape 1. Premier appel avec curl.**

```bash
exemples/02_premier_appel.sh
```

*Sortie* (18 novembre 2026) :

```text
modèle : inclusionai/ling-3.2-flash:free | fournisseur : Ant Digital
réponse : OpenRouter est une plateforme qui offre un point d'accès API unifié permettant d'utiliser et de comparer de nombreux modèles de langage (LLM) provenant de différents fournisseurs (OpenAI, Anthropic, Meta, Google, Mistral, etc.) via une seule interface, avec une facturation à l'usage et des fonctionnalités de routage automatique vers le modèle le plus adapté.
jetons : entrée 32 | sortie 180 | coût 0
```

Le script prend un autre modèle en argument : `exemples/02_premier_appel.sh google/gemma-4-31b-it:free`.

**Étape 2. Même appel avec la bibliothèque Python d'OpenAI.**

Seule l'adresse change par rapport à un appel à OpenAI :

```python
client = OpenAI(base_url="https://openrouter.ai/api/v1", api_key=os.environ["OPENROUTER_API_KEY"])
```

```bash
uv run --with openai python exemples/03_python_openai.py
```

*Sortie* (18 novembre 2026) :

```text
modèle : inclusionai/ling-3.2-flash:free
- **Abstraction multi-fournisseurs** : une seule API pour changer de modèle ou basculer en secours sans toucher au code applicatif.
- **Gouvernance** : point central pour l'authentification, les quotas, le filtrage (PII, modération) et la journalisation des requêtes.
- **Observabilité et coûts** : suivi des tokens et latences par équipe, cache sémantique et routage vers le modèle le moins cher adapté à la tâche.
```

## Dépannage

| Message | Cause | Remède |
|---|---|---|
| `429` | limite des modèles gratuits atteinte (20 par minute, 50 ou 1 000 par jour) ou fournisseur saturé | attendre, ou changer de modèle |
| `402` | plafond de la clé ou solde atteint | relever le plafond (chapitre 03) ou ajouter des crédits (chapitre 02) |
| `404` sur un modèle `:free` | gratuité retirée | reprendre la liste à jour (chapitre 04) |
| `401` | clé absente, expirée ou mal copiée | recopier la clé dans `.env` |
