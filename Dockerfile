FROM ubuntu:14.04
ENV DEBIAN_FRONTEND noninteractive
ENV ENV INITRD No
ENV DEBIAN_PRIORITY critical
ENV DEBCONF_NOWARNINGS yes

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y git supervisor python-flask python-pil cabextract xfonts-utils wget sqlite3 nginx
ADD supervisor_gullom.conf /etc/supervisor/conf.d/gullom.conf
ADD nginx_gullom.conf /etc/nginx/sites-available/gullom.conf
RUN ln -s /etc/nginx/sites-available/gullom.conf /etc/nginx/sites-enabled/gullom.conf
RUN rm /etc/nginx/sites-enabled/default
# tell Nginx to stay foregrounded
RUN echo "daemon off;" >> /etc/nginx/nginx.conf

WORKDIR /srv
ADD http://ftp.de.debian.org/debian/pool/contrib/m/msttcorefonts/ttf-mscorefonts-installer_3.6_all.deb /srv/ttf-mscorefonts-installer_3.6_all.deb
RUN dpkg -i ttf-mscorefonts-installer_3.6_all.deb
RUN git clone https://github.com/Raveline/Gullom.git
ADD config.py /srv/Gullom/config.py
RUN sqlite3 /srv/Gullom/giffy.db < /srv/Gullom/schema.sql
RUN adduser --system gullom
RUN chown -R gullom.nogroup Gullom

EXPOSE 80
CMD ["/usr/bin/supervisord", "-n"]