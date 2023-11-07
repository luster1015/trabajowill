##########Install nginx and copy virtualhost.
FROM  httpd
RUN apt-get update 
RUN apt install -y php
RUN apt install -y vim
COPY 6/index.htm /usr/local/apache2/htdocs/index.html

RUN apachectl restart
######Crear Carpeta asignar permisos all
RUN mkdir /juanguillermo-2672501
RUN chmod 777 /juanguillermo-2672501
RUN chmod -R 777 /usr/local/apache2/htdocs/*
#######################################Copiando la imagen en mi directorio
COPY images /juanguillermo-2672501
########################################Copiando y ejecutando script + permisos

COPY main.sh /juanguillermo-2672501
RUN chmod 777 /juanguillermo-2672501/main.sh
RUN sh /juanguillermo-2672501/main.sh
#############################################################################
EXPOSE 80