# https://docs.docker.com/engine/reference/builder/

# https://wiki.alpinelinux.org/wiki/Alpine_Linux_package_management
# https://wiki.alpinelinux.org/wiki/Nginx_with_PHP#Nginx_with_PHP7
# https://docs.nginx.com/nginx/admin-guide/installing-nginx/installing-nginx-docker/

# https://github.com/just-containers/s6-overlay

FROM alpine:3.8

EXPOSE 80

ARG USER="www-data"
ARG GROUP="www-data"

# Prerequisites
RUN apk update
RUN apk add bash
RUN adduser -D -g $USER $GROUP

# Install S6
ADD https://github.com/just-containers/s6-overlay/releases/download/v1.21.8.0/s6-overlay-amd64.tar.gz /tmp/
RUN tar xzf /tmp/s6-overlay-amd64.tar.gz -C /

# Install nginx
RUN apk add --no-cache nginx
RUN mkdir /run/nginx
RUN chown -R $USER:$GROUP /var/lib/nginx
RUN ln -sf /dev/stdout /var/log/nginx/access.log && \
    ln -sf /dev/stderr /var/log/nginx/error.log

# Install PHP 7
RUN apk add --no-cache php7=~7.2 \
                       php7-common=~7.2 \
                       php7-opcache=~7.2 \
                       php7-fpm=~7.2 \
                       php7-bz2=~7.2 \
                       php7-pdo=~7.2 \
                       php7-pdo_pgsql=~7.2 \
                       php7-pdo_sqlite=~7.2 \
                       php7-pdo_mysql=~7.2 \
                       php7-intl=~7.2 \
                       php7-json=~7.2 \
                       php7-mbstring=~7.2 \
                       php7-xml=~7.2 \
                       php7-simplexml=~7.2 \
                       php7-dom=~7.2 \
                       php7-exif=~7.2 \
                       php7-fileinfo=~7.2 \
                       php7-gd=~7.2 \
                       php7-imagick=~3.4 \
                       php7-mongodb=~1.4
RUN mkdir /var/run/php

# Overwrite config
COPY etc/ /etc/

# Create website entrypoint
RUN mkdir -p /var/www
RUN chown -R $USER:$GROUP /var/www
VOLUME ["/var/www"]

# Clean up
RUN rm -rf /tmp/*

# Startup
ENTRYPOINT ["/init"]
