FROM php:7.4-alpine

WORKDIR /var/www/html

COPY ./system:system
COPY ./install:install

RUN chmod +x install

RUN ./install

EXPOSE 80

CMD ["apache2-foreground"]
