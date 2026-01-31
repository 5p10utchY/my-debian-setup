# Debian Setup Script

Un script d'installation automatisé pour configurer rapidement une machine Debian (VM ou VPS) avec les paquets essentiels et les réglages personnalisés.

## Objectif

Pouvoir disposer d'une machine Debian complètement configurée et utilisable en quelques minutes après une installation fraîche.

## Fonctionnalités

- Installation des paquets de base essentiels
- Configuration des outils de développement
- Application des réglages personnalisés (bashrc, vimrc, tmux.conf, etc.)
- Support pour Debian 11, 12 et versions récentes

## Usage

```bash
bash install.sh
```

## Structure du projet

```
debian-setup/
├── install.sh           # Script principal d'installation
├── configs/             # Fichiers de configuration à appliquer
│   ├── bashrc
│   ├── vimrc
│   ├── tmux.conf
│   └── ...
├── scripts/             # Scripts utilitaires additionnels
└── README.md
```

## Prérequis

- Accès root ou sudo
- Connexion Internet
- Debian fraîchement installé (recommandé)

## Notes

Ce script est conçu pour être idempotent - il peut être exécuté plusieurs fois sans causer de problèmes.
