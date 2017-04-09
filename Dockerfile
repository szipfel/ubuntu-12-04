FROM ubuntu:12.04
MAINTAINER Steve Zipfel <steve@webrepublic.ca>
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

# Install packages.
RUN apt-get update
RUN apt-get install -y vim git apache2 php5 curl wget \
supervisor unzip php5-mysql

RUN apt-get clean

#Start up Apache
RUN /etc/init.d/apache2 start

EXPOSE 80 
CMD exec supervisord -n
