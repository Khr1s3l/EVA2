# Utilizar una imagen base de Debian
FROM debian:latest

# Actualizar el repositorio e instalar dependencias
RUN apt-get update && apt-get install -y \
    wget \
    build-essential \
    apache2 \
    libapache2-mod-php \
    php \
    php-gd \
    libgd-dev \
    unzip

# Descargar Nagios Core
RUN wget https://assets.nagios.com/downloads/nagioscore/releases/nagios-4.4.6.tar.gz \
    && tar xzf nagios-4.4.6.tar.gz \
    && cd nagios-4.4.6 \
    && ./configure --with-httpd-conf=/etc/apache2/sites-enabled \
    && make all \
    && make install-groups-users \
    && usermod -aG nagios www-data \
    && make install \
    && make install-daemoninit \
    && make install-commandmode \
    && make install-config \
    && make install-webconf \
    && a2enmod rewrite \
    && a2enmod cgi

# Configurar la autenticación de Nagios
RUN htpasswd -b -c /usr/local/nagios/etc/htpasswd.users nagiosadmin nagiosadmin

# Limpiar archivos de instalación
RUN rm -rf /nagios-4.4.6 nagios-4.4.6.tar.gz

# Configurar Nagios para que se inicie automáticamente
COPY start.sh /start.sh
RUN chmod +x /start.sh

# Exponer el puerto 80
EXPOSE 80

# Comando para iniciar Apache y Nagios
CMD ["/start.sh"]
