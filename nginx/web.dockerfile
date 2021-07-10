FROM nginx

COPY nginx.conf /etc/nginx/

RUN apt-get update \
    && apt-get install -y ssl-cert \
    && apt-get clean \
    && rm -r /var/lib/apt/lists/*

WORKDIR /var/www

CMD ["/usr/sbin/nginx"]
