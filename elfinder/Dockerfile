FROM php:alpine

ENV \
   ELFINDER_VER="2.1.23" \
   UID="1069" \
   GID="1069"

WORKDIR /var/www/html

RUN echo http://dl-2.alpinelinux.org/alpine/edge/community/ >> /etc/apk/repositories && \
    apk --no-cache add unzip shadow && \
    curl -L -O https://github.com/Studio-42/elFinder/archive/${ELFINDER_VER}.zip && \
    unzip *.zip && \
    rm -f *.zip && \
    mv elFinder-* elFinder && \
    mv elFinder/php/connector.minimal.php-dist elFinder/php/connector.minimal.php && \
    rm -rf elFinder/files && \
    ln -s /data /var/www/html/elFinder/files

ADD run.sh /run.sh

RUN chmod +x /run.sh && \
    ls -la / && \
    usermod -u ${UID} www-data && \
	find / -user 33 -exec chown -h ${UID} {} \; 

VOLUME /data

LABEL description="Web-based filer" \
      maintainer="zerpex <zerpex@gmail.com>"

CMD ["/run.sh"]
