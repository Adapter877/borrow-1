# Use the official PHP image with Apache
FROM php:8.1-apache

# Set environment variables
ENV APACHE_DOCUMENT_ROOT /var/www/html/public

# Install necessary PHP extensions

RUN apt-get update && apt-get install -y \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    libzip-dev \
    zip \
    unzip \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install gd \
    && docker-php-ext-install pdo pdo_mysql mysqli zip

# Enable Apache mod_rewrite
RUN a2enmod rewrite

# Set up the Apache configuration
COPY 000-default.conf /etc/apache2/sites-available/000-default.conf

# Copy the current directory contents into the container
COPY . /var/www/html

# Set the working directory
WORKDIR /var/www/html

# Change ownership of the web directory
RUN chown -R www-data:www-data /var/www/html

# Expose port 80
EXPOSE 80

# Start Apache server
CMD ["apache2-foreground"]
