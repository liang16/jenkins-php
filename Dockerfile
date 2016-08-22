# Official images are cool.
FROM jenkins

# Jenkins is using jenkins user, we need root to install things.
USER root

# Install php packages.
RUN apt-get update && \
	apt-get -y -f install php5-cli php5-dev php5-curl curl php-pear ant

# Install php xdebug extension for code coverage
# Setup the Xdebug version to install
ENV XDEBUG_VERSION 2.4.1
ENV XDEBUG_SHA1 52b5cede5dcb815de469d671bfdc626aec8adee3

# Install Xdebug
RUN set -x \
     && curl -SL "http://www.xdebug.org/files/xdebug-$XDEBUG_VERSION.tgz" -o xdebug.tgz \
     && echo $XDEBUG_SHA1 xdebug.tgz | sha1sum -c - \
     && mkdir -p /usr/src/xdebug \
     && tar -xf xdebug.tgz -C /usr/src/xdebug --strip-components=1 \
     && rm xdebug.* \
     && cd /usr/src/xdebug \
     && phpize \
     && ./configure \
     && make -j"$(nproc)" \
     && make install \
     && make clean

#COPY ext-xdebug.ini /etc/php5/mods-available/
#COPY ext-xdebug.ini /etc/php5/cli/conf.d/

# install phpunit
RUN curl -L https://phar.phpunit.de/phpunit.phar -o /usr/local/bin/phpunit \
	&& chmod a+x /usr/local/bin/phpunit

RUN apt-get clean -y

# Go back to jenkins user.
USER jenkins
