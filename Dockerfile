FROM		debian:latest
MAINTAINER 	Keresztes Peter-Zoltan
USER 		root

ENV			DEBIAN_FRONTEND noninteractive

RUN 		apt-get update

RUN			apt-get install -y --force-yes apt-utils

RUN 		apt-get upgrade -y --force-yes

RUN 		apt-get install -y --force-yes mariadb-server php5 php5-cli php5-mysql php5-fpm curl wget sudo net-tools supervisor

RUN 		wget http://nginx.org/keys/nginx_signing.key -O - | apt-key add - && \
			echo "deb http://nginx.org/packages/mainline/debian/ jessie nginx" | tee -a /etc/apt/sources.list.d/nginx.list && \
			echo "deb-src http://nginx.org/packages/mainline/debian/ jessie nginx" | tee -a /etc/apt/sources.list.d/nginx.list

RUN			apt-get update && \
			apt-get -y --force-yes install nginx

RUN			sed -i 's/^listen.owner.*/listen.owner\ =\ nginx/g' /etc/php5/fpm/pool.d/www.conf && \
			sed -i 's/^listen.group.*/listen.group\ =\ nginx/g' /etc/php5/fpm/pool.d/www.conf && \
			sed -i 's/^user.*/user\ =\ nginx/g' /etc/php5/fpm/pool.d/www.conf && \
			sed -i 's/^group.*/group\ =\ nginx/g' /etc/php5/fpm/pool.d/www.conf

ADD         siteconf/some_domain.conf /etc/nginx/conf.d/some_domain.conf

VOLUME		/opt/toptal/webroot/ /var/www/some_domain

RUN			chown -R nginx. /var/www/some_domain && \
			rm -rf /etc/nginx/conf.d/default.conf
			
ADD  		toptal_test/conf/supervisord/supervisord.conf /etc/supervisor/supervisord.conf

EXPOSE 		80

WORKDIR		/root

ENTRYPOINT	["/usr/bin/supervisord", "-c", "/etc/supervisor/supervisord.conf"]