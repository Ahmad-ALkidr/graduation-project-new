# Use a simple and official PHP 8.2 base image
FROM php:8.2-cli

# Set the working directory inside the container
WORKDIR /var/www/html

# Install necessary system dependencies for Laravel and PostgreSQL
RUN apt-get update && apt-get install -y \
    zip \
    unzip \
    libpq-dev \
    && apt-get clean

# Install required PHP extensions
RUN docker-php-ext-install pdo pdo_pgsql bcmath

# Install Composer (the PHP package manager)
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Copy all your application files into the container
COPY . .

# Install composer dependencies
# This command also runs 'php artisan package:discover'
RUN composer install --no-dev --no-interaction --prefer-dist --optimize-autoloader

# Generate the application key
RUN php artisan key:generate

# Set the correct permissions for storage and cache folders
RUN chown -R www-data:www-data storage bootstrap/cache
RUN chmod -R 775 storage bootstrap/cache

# Expose the port that Render will use to communicate with your app
EXPOSE 10000

# The final command to run when the container starts.
# It first runs database migrations and then starts the web server.
CMD php artisan migrate --force && php artisan serve --host 0.0.0.0 --port 10000
