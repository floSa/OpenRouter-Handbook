# 09. Brancher la clé dans un outil

> **Point de départ** : clé (chapitre 03) et modèle (chapitre 04). **Résultat** : savoir quoi saisir dans un outil.

Tout outil qui accepte une API « compatible OpenAI » se règle avec les trois valeurs du chapitre 07 : adresse `https://openrouter.ai/api/v1`, clé, identifiant du modèle. Beaucoup d'outils proposent aussi « OpenRouter » directement dans leur liste de fournisseurs : seule la clé est alors demandée.

| Outil | Réglage à choisir |
|---|---|
| Open WebUI | Paramètres d'administration › Connexions › connexion OpenAI : adresse et clé |
| Cline | fournisseur « OpenRouter », ou « OpenAI Compatible » avec l'adresse |
| Goose | fournisseur « OpenRouter » |
| LiteLLM | modèle `openrouter/<identifiant>` et variable `OPENROUTER_API_KEY` |

Ces branchements ne sont pas encore essayés dans ce manuel : ils feront l'objet d'un chapitre par outil, avec captures, une fois testés.

Une clé par outil (chapitre 03) permet de lire la consommation de chacun dans « Activity ».
