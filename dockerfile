#Indicamos la imagen de Ubuntu a utilizar, en este caso la version 20.04
FROM ubuntu:20.04

# Definición de variables de entorno
#Se define la varibale de entorno referente a la contraseña para el usuario root de mariadb
ENV MYSQL_ROOT_PASSWORD=rootpassword
#Se define la varibale de entorno que creara una base de datos llamada mydatabase cuando se cree el contenedor
ENV MYSQL_DATABASE=mydatabase
#Se define la varibale de entorno que inidca el nombre de usuario para la base de datos
ENV MYSQL_USER=myuser
#se define la variable de entorno para la contraseña del usuario para la base de datos
ENV MYSQL_PASSWORD=mypassword

#el comando run permite ejecutar uno o mas comandos en el contendor durante el proceso de creacion de la imagen
#ademas la linea actualiza los paquetes disponibles desde el repositorio de ubuntu ademas de que instala los paquetes que se especifican en las siguenteslineas
RUN apt-get update && apt-get install -y \
#paquete de apache que se instalara
    apache2 \
#paquete de mariadb que se instalara
    mariadb-server \
#comando para limpiar el cache de los paquetes para reducir la el tamaño final de la imagen
    && apt-get clean

#con este comando se especifica que el comando se ejecutara cuando se inicie un contenedor a partir de la imagen
#iniciara el servicio del servidor apache y el servicio de maria db ademas de que se mantendra el contenedor en ejecucion gracias a este comnado
#Esto permite que el contenedor se mantenga en ejecucion
CMD service apache2 start && service mysql start && tail -f /dev/null
