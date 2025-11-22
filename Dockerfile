FROM nginx:alpine

COPY app/ /usr/share/nginx/html/

RUN touch /usr/share/nginx/html/current_version.txt

CMD ["nginx", "-g", "daemon off;"]
