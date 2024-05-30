#!/bin/bash

# Iniciar Apache
service apache2 start

# Iniciar Nagios
service nagios start

# Mantener el contenedor en ejecución
tail -f /var/log/apache2/error.log
