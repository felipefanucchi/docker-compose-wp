FROM php:7.2-alpine as builder

FROM wordpress

# Install composer
RUN apt-get update && apt-get install -y libpq-dev libmemcached-dev curl libz-dev libpng-dev libfreetype6-dev libjpeg-dev libxpm-dev libxml2-dev libxslt-dev libmcrypt-dev libwebp-dev
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Install Nodejs and NPM
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash - \
    && apt-get install -y nodejs

# Note: Use docker-compose up -d --force-recreate --build when Dockerfile has changed.