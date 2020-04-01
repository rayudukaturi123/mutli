FROM centos

MAINTAINER sai@pushtii.com

RUN yum update -y

RUN yum install apache2 -y

ADD test.html /usr/local/apache2/htdocs/test.

USER root

WORKDIR /var/www/html

EXPOSE 80

CMD /usr/bin/apache2ctl -D FORGROUND


