FROM ubuntu:18.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
    && apt-get install -yq software-properties-common \
    && add-apt-repository ppa:ondrej/php \
    && apt-get update \
    && apt-get install -yq \
    git \
    curl \
    zip \
    unzip\
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    npm \
    # php
    php-mbstring \
    php-xml \
    php-bcmath \
    php-bz2 \
    php-curl \
    php-fpm \
    php-gd \
    php-gmp \
    php-imagick \
    php-json \
    php-mysql \
    php-pcov \
    php-soap \
    php-zip \
    && apt-get clean \
    && rm -r /var/lib/apt/lists/*

# installing composer 2 and npm
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
    && php composer-setup.php --install-dir=/usr/local/bin --filename=composer

RUN npm install -g n \
    && n latest \

RUN npm install -g npm@latest

# php config
RUN sed -i 's/\/run\/php\/php8.0-fpm.sock/0.0.0.0:9000/' /etc/php/8.0/fpm/pool.d/www.conf \
    && mkdir /run/php \
    && touch /etc/php/8.0/fpm/conf.d/uploads.ini \
    && echo "post_max_size = 3G;" >> /etc/php/8.0/fpm/conf.d/uploads.ini \
    && echo "upload_max_filesize = 3G;" >> /etc/php/8.0/fpm/conf.d/uploads.ini \
    && touch /run/php/php8.0-fpm.pid

# Set working directory
WORKDIR /var/www
RUN apt-get update && apt-get install -y

EXPOSE 9000

CMD ["php-fpm8.0", "-F"]
