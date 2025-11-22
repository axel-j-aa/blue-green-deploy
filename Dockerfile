FROM nginx:alpine

COPY app/ /usr/share/nginx/html/

# Copiar siempre un archivo por defecto
RUN echo "UNKNOWN" > /usr/share/nginx/html/current_version.txt

EXPOSE 80
