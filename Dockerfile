# Utilise une image légère d'Apache avec PHP
FROM php:8.2-apache

# Copie tout le contenu de votre dossier actuel vers le serveur web
COPY . /var/www/html/

# Donne les droits d'accès au serveur web
RUN chown -R www-data:www-data /var/www/html/

# Expose le port 80
EXPOSE 80