# VVIMS Web React - Configuration Multi-Environnements

## 🚀 Scripts Disponibles

### Développement
```bash
# Développement FODECC (Online)
npm run dev:fodecc

# Développement CNPS (Offline)
npm run dev:cnps
```

### Build
```bash
# Build FODECC
npm run build:fodecc

# Build CNPS
npm run build:cnps
```

### Production
```bash
# Démarrer FODECC
npm run start:fodecc

# Démarrer CNPS
npm run start:cnps
```

## 🌍 Configuration des Environnements

### FODECC (Online)
- **API Server**: `https://giscardntchinda-vvim-backend.hf.space`
- **GraphQL URL**: `https://faithful-lynx-39.hasura.app/v1/graphql`
- **Géolocalisation**: Dynamique
- **Nom Entreprise**: "FODECC / CCODEF"
- **Format Date**: `HH'h'mm`

### CNPS (Offline)
- **API Server**: `http://172.17.15.28:30000`
- **GraphQL URL**: `http://172.17.15.28:30011/v1/graphql`
- **Géolocalisation**: Statique `(3.8764544, 11.5146752)`
- **Nom Entreprise**: "CNPS"
- **Format Date**: `HH:mm:ss.SSSSSS`

## 🔧 Fonctionnalités Spéciales

### Géolocalisation
- **FODECC**: Utilise la géolocalisation du navigateur
- **CNPS**: Utilise les coordonnées statiques prédéfinies

### Formatage des Dates
- **FODECC**: Format français avec `HH'h'mm`
- **CNPS**: Format technique avec millisecondes

### Upload de Fichiers
- **FODECC**: `upload_type=online`
- **CNPS**: `upload_type=local`

### Gestion des Zones de Travail
- **FODECC**: Les employés peuvent sélectionner leur zone de travail via un sélecteur déroulant
- **CNPS**: La zone de travail est gérée automatiquement par l'administrateur

## 📁 Structure des Fichiers

```
config/
├── environments.ts          # Configuration des environnements
src/
├── hooks/
│   └── useLocation.ts      # Hook de géolocalisation adaptatif
├── lib/
│   ├── config/
│   │   └── api.ts          # Configuration API dynamique
│   ├── graphql/
│   │   └── client.ts       # Client GraphQL dynamique
│   └── utils/
│       └── dateFormat.ts   # Formatage de dates adaptatif
```

## 🎯 Utilisation

### Développement
```bash
# Pour FODECC (Online)
npm run dev:fodecc

# Pour CNPS (Offline)
npm run dev:cnps
```

### Build Production
```bash
# Build FODECC
npm run build:fodecc

# Build CNPS
npm run build:cnps
```

### Test des Configurations
```bash
# Vérifier que les builds fonctionnent
npm run build:fodecc && npm run build:cnps
```

## ✅ **Configuration Validée**

- ✅ **Builds fonctionnels** pour CNPS et FODECC
- ✅ **Géolocalisation adaptative** (statique pour CNPS, dynamique pour FODECC)
- ✅ **Formatage de dates** spécifique par environnement
- ✅ **Noms d'entreprise** dynamiques
- ✅ **URLs et secrets** adaptés par environnement
- ✅ **Pointage automatique** avec coordonnées statiques pour CNPS
- ✅ **Aucune demande de permission** pour CNPS

## 🔒 Sécurité

- Les configurations sont isolées par environnement
- Pas de risque de confusion entre CNPS et FODECC
- Géolocalisation sécurisée selon l'environnement

## 📝 Notes

- CNPS est **100% offline** avec coordonnées statiques
- FODECC utilise les **services cloud** avec géolocalisation dynamique
- Les **noms d'entreprise** s'adaptent automatiquement
- Les **formats de date** sont spécifiques à chaque environnement
