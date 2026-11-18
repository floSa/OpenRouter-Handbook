# OpenRouter

Accès à plusieurs centaines de modèles d'IA en ligne, gratuits ou payants, avec un seul compte et une seule clé.

Ce dépôt contient le manuel de prise en main (`documentations/`), avec captures, et les exemples d'appels exécutés (`exemples/`).

```text
OpenRouter-Prise-en-main/
├── README.md
├── LICENSE
├── .env.example            modèle du fichier de clé (.env, jamais versionné)
├── exemples/               appels à OpenRouter, avec leurs sorties vérifiées
├── outils/                 annotation des captures
└── documentations/
    ├── README.md           sommaire
    └── manuel/             chapitres 01 à 09 et leurs captures (img/)
```

## Essayer

```bash
cp .env.example .env               # puis y coller la clé (chapitre 03)
exemples/01_modeles_gratuits.sh    # modèles gratuits du moment
exemples/02_premier_appel.sh       # une question à un modèle gratuit
exemples/04_consommation.sh        # consommation et plafond de la clé
```

## Lire

| Besoin | Page |
|---|---|
| Prendre en main pas à pas | [Manuel](documentations/README.md) |
| Modèles gratuits | [Chapitre 04](documentations/manuel/04-choisir-un-modele.md) |
| Confidentialité | [Chapitre 05](documentations/manuel/05-confidentialite.md) |
| Coûts et suivi | [Chapitre 08](documentations/manuel/08-suivre-sa-consommation.md) |
