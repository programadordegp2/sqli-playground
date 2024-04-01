# Utilizamos una imagen base que tenga Apache y PHP
FROM php:apache

# Actualizamos e instalamos las dependencias necesarias
RUN apt-get update
RUN apt-get upgrade -y
#RUN apt-get install -y php-mysql
RUN docker-php-ext-install mysqli pdo pdo_mysql
RUN rm -rf /var/lib/apt/lists/*

# Copiamos los archivos de la página web a la carpeta del servidor web
COPY www/ /var/www/html/

# Copiamos el archivo SQL a una ubicación dentro del contenedor
COPY sql/ /tmp/sql/

# Cambiamos el propietario de los archivos al usuario y grupo de Apache
RUN chown -R www-data:www-data /var/www/html/

# Exponemos el puerto 80 para que Apache pueda recibir peticiones
EXPOSE 80

# Comando para iniciar Apache cuando se inicie el contenedor
CMD ["apache2-foreground"]

# Comando para importar el archivo SQL utilizando phpMyAdmin
RUN echo "create database tsasdb;" > /tmp/tsasdb.sql
RUN cat /tmp/sql/tsasdb.sql >> /tmp/tsasdb.sql