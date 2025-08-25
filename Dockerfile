FROM php:8.2-fpm-alpine

# تثبيت المتطلبات الأساسية فقط
RUN apk add --no-cache \
    git \
    libpq-dev \
    libzip-dev \
    zlib-dev \
    && docker-php-ext-install pdo pdo_pgsql zip bcmath

# تثبيت Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# نسخ ملفات المشروع
COPY . /var/www/html

WORKDIR /var/www/html

# تثبيت الاعتمادات عبر Composer
RUN composer install --no-dev --no-scripts --optimize-autoloader

# ضبط الأذونات
RUN chown -R www-data:www-data /var/www/html
RUN chmod -R 775 /var/www/html/storage /var/www/html/bootstrap/cache

# فتح المنفذ الافتراضي
EXPOSE 8000

# أمر التشغيل النهائي (استخدم سيرفر Laravel)
# CMD php artisan migrate:fresh --seed --force && php artisan serve --host=0.0.0.0 --port=8000
CMD ["php", "artisan", "serve", "--host=0.0.0.0", "--port=8000"]
