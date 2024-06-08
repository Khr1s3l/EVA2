# Nagios en docker

Este repositorio contiene el Dockerfile y scripts necesarios para construir una imagen Docker que ejecuta Nagios Core.

## Instalación de Git y Docker

Antes de comenzar, asegúrate de tener Git y Docker instalados en tu máquina. Aquí te mostramos cómo hacerlo en Debian GNU/Linux 12 (Bookworm).

### Instalación de Git

1. Actualiza el índice de paquetes:
    ```bash
    sudo apt update
    ```

2. Instala Git:
    ```bash
    sudo apt install git -y
    ```

### Instalación de Docker

1. Actualiza el índice de paquetes:
    ```bash
    sudo apt update
    ```

2. Instala los paquetes necesarios para usar el repositorio apt a través de HTTPS:
    ```bash
    sudo apt install apt-transport-https ca-certificates curl gnupg-agent software-properties-common
    ```

3. Añade la clave GPG oficial de Docker:
    ```bash
    curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

    ```

4. Usa el siguiente comando para configurar el repositorio:
    ```bash
    echo \
    "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian \ $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    ```

5. Actualiza el índice de paquetes nuevamente:
    ```bash
    sudo apt update
    ```

6. Instala Docker:
    ```bash
    sudo apt install docker-ce docker-ce-cli containerd.io
    ```
7. Prueba Docker(OPCIONAL):
    ```bash
    sudo docker run hello-world
    ```
## Construcción de la Imagen

1. Clona el repositorio:
    ```bash
    git clone https://github.com/Khr1s3l/EVA2.git
    cd EVA2
    ```

2. Construye la imagen Docker:
    ```bash
    sudo docker build -t nagios-core .
    ```

## Ejecución del Contenedor

1. Ejecuta el contenedor:
    ```bash
    sudo docker run -d -p 80:80 nagios-core
    ```

2. Abre un navegador web y navega a `http://IpPublicaMaquina/nagios`.

3. Inicia sesión con las siguientes credenciales:
    - **Usuario**: nagiosadmin
    - **Contraseña**: nagiosadmin

## Estructura del Repositorio

- `Dockerfile`: Archivo de configuración para construir la imagen Docker.
- `start.sh`: Script para iniciar Apache y Nagios dentro del contenedor.
- `README.md`: Instrucciones detalladas sobre cómo construir y ejecutar la imagen Docker.

## Contribuciones

Las contribuciones son bienvenidas. Por favor, crea un fork del repositorio y abre un pull request para revisar los cambios.

## Licencia

Este proyecto está licenciado bajo la Licencia MIT.
