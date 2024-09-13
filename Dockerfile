# Use the official PHP image with Apache
FROM php:apache

# Copy current directory contents into /var/www/html (the Apache document root)
COPY . /var/www/html

# Set the working directory
WORKDIR /var/www/html

# Expose port 80 for web traffic
EXPOSE 80

# Set file ownership and permissions (optional, for ensuring proper permissions)
RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 755 /var/www/html

# Install any additional PHP extensions if needed (optional)
# Example for installing PDO MySQL extension
# RUN docker-php-ext-install pdo pdo_mysql
RUN docker-php-ext-install mysqli

# Start Apache in the foreground (default command)
CMD ["apache2-foreground"]

