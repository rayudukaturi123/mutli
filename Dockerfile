FROM centos

MAINTAINER sai@pushtii.com

RUN yum update -y

RUN yum install httpd -y

ADD test.html /var/www/html/test.html

USER root

WORKDIR /var/www/html

EXPOSE 80


