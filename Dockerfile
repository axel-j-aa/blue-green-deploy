FROM nginx:alpine

# Copiar HTML
COPY app/index.html /usr/share/nginx/html/index.html

# Archivo de versión
RUN touch /version

# Variable por defecto
ENV VERSION=UNKNOWN

# Usamos el entrypoint original de nginx + nuestro script
CMD sh -c "echo $VERSION > /version && nginx -g 'daemon off;'"
