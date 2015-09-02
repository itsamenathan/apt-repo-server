from debian:latest

RUN apt-get --quiet --yes update && \ 
    apt-get --quiet --yes install \
      dpkg-dev \
      inotify-tools \
      nginx \
      supervisor\
      && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists

ADD supervisord.conf /etc/supervisor/
ADD nginx.conf /etc/nginx/sites-enabled/default
ADD startup.sh /
ADD scan.sh /

EXPOSE 80
VOLUME /data
ENTRYPOINT ["/startup.sh"]
