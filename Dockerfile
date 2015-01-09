FROM ubuntu:trusty
MAINTAINER Marc Richter <mr@in-telegence.net>

# Install base packages
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && \
    apt-get -yq install \
        curl \
        apache2 \
        libapache2-mod-php5 \
        php5-mysql \
        php5-gd \
        php5-curl \
        php-pear \
        php-apc && \
    apt-get -yq dist-upgrade && \
    rm -rf /var/lib/apt/lists/*
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Add files and set permissions
ADD php.ini /etc/php/apache2/php.ini
ADD run.sh /run.sh
RUN chmod 755 /*.sh
RUN touch /var/log/apache2/php_errors.log && \
    chmod 777 /var/log/apache2/php_errors.log
RUN mkdir -p /app && \
    rm -fr /var/www/html && \
    ln -s /app /var/www/html && \
    chown www-data:www-data /app -R

EXPOSE 80
WORKDIR /app
CMD ["/run.sh"]

