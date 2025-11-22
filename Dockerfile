FROM nginx:alpine

# Copiamos la app al contenedor
COPY app/index.html /usr/share/nginx/html/index.html

# Archivo /version (se reemplaza al iniciar el contenedor)
RUN touch /version

# Variable por defecto
ENV VERSION=UNKNOWN

# Al arrancar el contenedor → escribe VERSION en /version
CMD ["sh", "-c", "echo $VERSION > /version && nginx -g 'daemon off;'"]
