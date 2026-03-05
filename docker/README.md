# Docker Configuration

Ce dossier contient les configurations Docker pour les environnements de développement et de production.

## Structure

```
docker/
├── dev/                      # Configuration développement
│   ├── docker-compose.yml    # Compose pour développement
│   └── .env                  # Variables d'environnement dev
├── prod/                     # Configuration production
│   ├── docker-compose.yml    # Compose pour production
│   └── .env                  # Variables d'environnement prod
└── common/                   # Fichiers communs (si nécessaire)
```

## Utilisation

### Mode Développement

```bash
# Démarrer les conteneurs
make dev-up

# Voir les logs
make dev-logs

# Arrêter les conteneurs
make dev-down

# Redémarrer
make dev-restart
```

### Mode Production

```bash
# Démarrer les conteneurs
make prod-up

# Voir les logs
make prod-logs

# Arrêter les conteneurs
make prod-down

# Redémarrer
make prod-restart
```

### Commandes Utiles

```bash
# Afficher l'aide
make help

# Nettoyer tous les conteneurs et volumes
make clean
```

## Différences Dev vs Prod

### Développement
- Hot reload activé pour backend et frontend
- Mongo Express accessible sur le port 8081
- npm install + npm run dev
- Volumes montés pour le code source
- Pas de restart policy

### Production
- Build optimisé avec npm ci --only=production
- Pas de Mongo Express
- restart: always sur tous les services
- Health checks configurés
- Optimisé pour la performance
