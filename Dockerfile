# Stage 1: Build the base image
FROM php:8.2-fpm-alpine

# Install system dependencies
RUN apk add --no-cache \
    nginx \
    git \
    supervisor \
    # Install PostgreSQL client libraries
    libpq-dev \
    # Other system dependencies as needed
    && docker-php-ext-install pdo pdo_pgsql zip bcmath

# Install Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Copy application files
COPY . /var/www/html

# Set working directory
WORKDIR /var/www/html

# Install Composer dependencies
RUN composer install --no-dev --optimize-autoloader

# Set correct permissions
RUN chown -R www-data:www-data /var/www/html
RUN chmod -R 775 /var/www/html/storage /var/www/html/bootstrap/cache

# Expose the web server port
EXPOSE 8000

# Copy Nginx and Supervisor configurations
COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY supervisord.conf /etc/supervisord.conf

# Final command to run
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]
