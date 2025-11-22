FROM nginx:alpine

# Copia la app
COPY app/ /usr/share/nginx/html/

# Versión por defecto si no se pasa ninguna variable
ENV VERSION=UNKNOWN

# Al iniciar el contenedor, SOBREESCRIBE el fichero con la versión correcta
CMD ["sh", "-c", "echo $VERSION > /usr/share/nginx/html/current_version.txt && nginx -g 'daemon off;'"]
