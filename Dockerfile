FROM tokaido/php71-fpm:stable
ENV DEBIAN_FRONTEND noninteractive
COPY config/php.ini /etc/php/7.1/fpm/php.ini

USER root
RUN apt-get update && \
    apt-get install -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" \      
      php-xdebug \
    && chown tok:web /etc/php/7.1/fpm/ -R
  
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chown tok:web /usr/local/bin/entrypoint.sh \
    && chmod 770 /usr/local/bin/entrypoint.sh

USER tok
