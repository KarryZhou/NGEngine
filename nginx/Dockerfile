FROM nginx:1.9.0

ADD  nginx.conf      /etc/nginx/nginx.conf
ADD  sites-enabled/*    /etc/nginx/conf.d/
RUN  mkdir /opt/application && mkdir /opt/log && mkdir /opt/log/nginx
RUN  chown -R www-data.www-data /opt/application /opt/log

EXPOSE 80
VOLUME ["/opt"]

