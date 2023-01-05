#!/bin/bash
docker-compose exec -T php-fpm chmod -R 777 storage/ bootstrap/
docker-compose exec -T php-fpm cp .env.example .env
docker-compose exec -T php-fpm composer install
docker-compose exec -T php-fpm php artisan optimize:clear
docker-compose exec -T php-fpm php artisan key:generate
docker-compose exec -T php-fpm php artisan config:cache
