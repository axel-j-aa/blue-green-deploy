FROM nginx:alpine

COPY app/index.html /usr/share/nginx/html/index.html

RUN touch /version

ENV VERSION=UNKNOWN

CMD ["sh", "-c", "echo -n $VERSION > /version && exec nginx -g 'daemon off;'"]
