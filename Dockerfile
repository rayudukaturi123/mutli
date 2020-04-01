FROM httpd

MAINTAINER sai@pushtii.com

ADD test.html /var/www/html/test.html

USER root

WORKDIR /var/www/html

EXPOSE 80


