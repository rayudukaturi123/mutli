FROM ubuntu

RUN yum update -y

RUN apt install httpd -y

ADD test.html /var/www/html/test.html

EXPOSE 80

CMD /usr/sbin/apache2ctl -D FOREGROUND
