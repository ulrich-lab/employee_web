# Étape 1 : Build de l'application Next.js
FROM node:18-alpine AS builder
WORKDIR /app
COPY vvims_web_react/package.json ./
RUN npm install
COPY vvims_web_react/ .
RUN npm run build:cnps && npm run export:cnps

# Étape 2 : Servir avec nginx
FROM nginx:alpine
RUN rm -rf /usr/share/nginx/html/*
# Copier les fichiers statiques générés vers nginx
COPY --from=builder /app/out /usr/share/nginx/html
COPY nginx.conf /etc/nginx/nginx.conf
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]