FROM php:5-fpm
MAINTAINER Christophe Meneboeuf <christophe@xtof.info>

ENV HOME /root
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update 
RUN apt-get install -y \
        vim git curl wget build-essential
RUN apt-get install -y \
        python-software-properties bzip2
RUN apt-get install -y \
        libfreetype6-dev libtidy-dev\
        libjpeg62-turbo-dev 
RUN apt-get install -y \
        libmcrypt-dev \
        libpng12-dev \
	libcurl4-gnutls-dev \
        zlib1g-dev libicu-dev g++
RUN docker-php-ext-configure intl
RUN docker-php-ext-install -j$(nproc) iconv mcrypt json gd  tidy pdo mysql mysqli mbstring intl opcache curl
RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ 
RUN docker-php-ext-enable gd.so iconv.so intl.so json.so mcrypt.so mysql.so mysqli.so mbstring.so opcache.so curl.so pdo.so tidy.so


# Expose PHP-FPM port
EXPOSE 9000

