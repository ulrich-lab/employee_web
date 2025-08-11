# Build de l'application Next.js
FROM node:18-alpine AS builder
WORKDIR /app
COPY vvims_web_react/package.json ./
RUN npm install
COPY vvims_web_react/ .
RUN npm run build:cnps

# Serveur de production Next.js
FROM node:18-alpine
WORKDIR /app
COPY --from=builder /app/package.json ./
COPY --from=builder /app/.next ./.next
COPY --from=builder /app/public ./public
RUN npm install --only=production
EXPOSE 3000
CMD ["npm", "run", "start:cnps"]