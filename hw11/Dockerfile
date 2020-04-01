FROM docker.io/alpine

RUN apk update && apk upgrade && apk add nginx && mkdir -p /run/nginx
COPY index.html /var/lib/nginx/html/index.html
COPY default.conf /etc/nginx/conf.d/default.conf
EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
