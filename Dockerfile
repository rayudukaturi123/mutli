FROM centos

MAINTAINER sai@pushtii.com

RUN yum update -y

RUN yum install httpd -y

ADD test.html /usr/local/apache2/htdocs/test.

USER root

WORKDIR /var/www/html

EXPOSE 80


