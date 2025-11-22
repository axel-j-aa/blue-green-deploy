FROM nginx:alpine

# Copiar archivos HTML
COPY app/ /usr/share/nginx/html/

# Crear archivo por si no existe
RUN echo "UNKNOWN" > /usr/share/nginx/html/current_version.txt

EXPOSE 80
