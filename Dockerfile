FROM nginx:alpine

COPY app/index.html /usr/share/nginx/html/index.html

RUN touch /version

ENV VERSION=UNKNOWN

ENTRYPOINT []

CMD ["sh", "-c", "echo $VERSION > /version && nginx -g 'daemon off;'"]
