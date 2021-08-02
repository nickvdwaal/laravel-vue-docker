# A Laravel and Vuejs Docker setup


## About this setup

This setup was created for me personally to easily setup new projects with a Laravel and Vuejs base.

Within this setup are included:

- Nginx Webserver (Latest)
- MariaDB (Latest)
- PhpMyAdmin
- Mailhog
- Ubuntu App Container (18.04)

The app container is setup with git, composer (2.1.3) and npm (7.18.1) and these additional packages:
- git
- curl
- zip
- unzip
- libpng-dev
- libonig-dev
- libxml2-dev
- php-mbstring
- php-xml
- php-bcmath
- php-bz2
- php-curl
- php-fpm
- php-gd
- php-gmp
- php-imagick
- php-json
- php-mysql
- php-pcov
- php-soap
- php-zip

## Running

Install composer packages \
```composer install```

Install npm packages \
```npm install```

compile assets \
```npm run dev```
