FROM		debian:latest
MAINTAINER 	Keresztes Peter-Zoltan
USER 		root

ENV			DEBIAN_FRONTEND noninteractive

RUN 		apt-get update
RUN 		apt-get upgrade -y --force-yes
RUN 		apt-get install -y --force-yes mariadb-server php5 php5-cli php5-mysql php5-fpm curl wget sudo 
RUN 		wget http://nginx.org/keys/nginx_signing.key -O - | apt-key add -
RUN			echo "deb http://nginx.org/packages/mainline/debian/ jessie nginx" | tee -a /etc/apt/sources.list.d/nginx.list
RUN			echo "deb-src http://nginx.org/packages/mainline/debian/ jessie nginx" | tee -a /etc/apt/sources.list.d/nginx.list
RUN			apt-get update && \
			apt-get -y --force-yes install nginx