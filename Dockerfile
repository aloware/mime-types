FROM php:8.5-cli-alpine

RUN curl -Ls https://getcomposer.org/composer.phar > /usr/local/bin/composer && \
    chmod +x /usr/local/bin/composer

CMD ["/bin/sh"]
