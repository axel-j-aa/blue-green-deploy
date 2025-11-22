FROM nginx:alpine

COPY app/ /usr/share/nginx/html/

ENV VERSION=UNKNOWN

# Sobrescribe el archivo cada vez que el contenedor inicia
CMD sh -c "echo $VERSION > /usr/share/nginx/html/current_version.txt && nginx -g 'daemon off;'"
