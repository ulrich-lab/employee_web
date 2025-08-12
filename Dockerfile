# ==============================
# Étape 1 : Build de l'application Next.js
# ==============================
FROM node:18-alpine AS builder
WORKDIR /app

# Copie du package.json et installation des dépendances
COPY package.json ./
RUN npm install

# Copie du code source
COPY . .

# Création du dossier public s'il n'existe pas (évite erreur COPY)
RUN mkdir -p public

# Build de l'application
RUN npm run build:cnps

# ==============================
# Étape 2 : Serveur de production Next.js
# ==============================
FROM node:18-alpine
WORKDIR /app

# Copie uniquement les fichiers nécessaires depuis le builder
COPY --from=builder /app/package.json ./
COPY --from=builder /app/.next ./.next
COPY --from=builder /app/public ./public
COPY --from=builder /app/next.config.js ./

# Installation des dépendances de production + cross-env
RUN npm install --only=production && npm install cross-env

# Exposition du port 3000 (cohérent avec Next.js)
EXPOSE 3000

# Commande de démarrage
CMD ["npm", "run", "start:cnps"]
