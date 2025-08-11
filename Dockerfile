# Étape 1 : Build de l'application Next.js
FROM node:18-alpine AS builder

# Dossier de travail
WORKDIR /app

# Copier les fichiers de dépendances
COPY vvims_web_react/package.json ./

# Installer les dépendances
RUN npm install

# Copier le reste du code
COPY vvims_web_react/ .

# Build de l'application pour CNPS (offline)
RUN npm run build:cnps

# Étape 2 : Servir avec nginx
FROM nginx:alpine

# Supprimer la config par défaut
RUN rm -rf /usr/share/nginx/html/*

# Copier les fichiers statiques générés vers nginx
COPY --from=builder /app/.next /usr/share/nginx/html

# Copier une configuration nginx personnalisée
COPY nginx.conf /etc/nginx/nginx.conf

# Exposer le port HTTP
EXPOSE 80

# Lancer nginx
CMD ["nginx", "-g", "daemon off;"]
