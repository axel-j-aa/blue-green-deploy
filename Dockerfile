FROM nginx:alpine

# Copia tu HTML
COPY app/ /usr/share/nginx/html/

# Archivo donde se guardará BLUE/GREEN
RUN touch /usr/share/nginx/html/current_version.txt

# Variable por defecto
ENV VERSION=UNKNOWN

# AL ARRANCAR EL CONTENEDOR → ESCRIBE LA VERSIÓN EN current_version.txt
CMD ["sh", "-c", "echo $VERSION > /usr/share/nginx/html/current_version.txt && nginx -g 'daemon off;'"]
