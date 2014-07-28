FROM    ubuntu

RUN     apt-get update
RUN     apt-get install -y nginx
RUN     echo "daemon off;" >> /etc/nginx/nginx.conf
RUN     rm -f /etc/nginx/sites-enabled/default

ADD     . /data
RUN     cp /data/etc/nginx-site.conf /etc/nginx/sites-available/schulteaas
RUN     ln -s /etc/nginx/sites-available/schulteaas /etc/nginx/sites-enabled/schulteass

EXPOSE	80
CMD     /usr/sbin/nginx -c /etc/nginx/nginx.conf
