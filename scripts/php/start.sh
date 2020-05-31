#!/usr/bin/env sh

set -e

role=${CONTAINER_ROLE:-app}

if [ "$role" = "app" ]; then
    exec php-fpm
elif [ "$role" = "scheduler" ]; then
    while [ true ]
    do
      php /var/www/html/artisan schedule:run --verbose --no-interaction &
      sleep 60
    done
elif [ "$role" = "horizon" ]; then
    echo "Running Horizon..."
    exec /usr/bin/supervisord -n
else
    echo "Could not match the container role \"$role\""
    exit 1
fi