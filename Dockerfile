# Stage 1: Build the Angular app
FROM node:18 as build
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

# Stage 2: Serve the Angular app using Nginx
FROM nginx:alpine
COPY --from=build /app/dist/ma-frontend /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]



# # Utiliser l'image de base Node.js
# FROM node:18

# # Définir le répertoire de travail dans le conteneur
# WORKDIR /usr/src/app

# # Copier les fichiers package.json et package-lock.json pour installer les dépendances
# COPY package*.json ./

# # Installer les dépendances
# RUN npm install

# # Copier tous les fichiers source de l'application dans le conteneur
# COPY . .
# COPY src .

# # Construire l'application Angular
# RUN npm run build

# # Exposer le port 80 (le port par défaut pour les applications web HTTP)
# EXPOSE 80

# # Démarrez l'application Angular lorsque le conteneur est lancé
# CMD ["npm", "start"]
