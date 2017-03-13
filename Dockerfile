FROM oberthur/docker-ubuntu:16.04
MAINTAINER Lukasz Bielinski <l.bielinski@oberthur.com>

RUN apt-get update \
    && apt-get -y upgrade \
    && apt-get clean autoclean \
    && apt-get autoremove --yes \
    && rm -rf /var/lib/{apt,dpkg,cache,log}


COPY flannel/dist/flanneld-amd64 /opt/bin/flanneld
COPY flannel/dist/iptables-amd64 /usr/local/bin/iptables
COPY flannel/dist/mk-docker-opts.sh /opt/bin/
COPY flannel/dist/libpthread.so.0-amd64 /lib/libpthread.so.0
CMD ["/opt/bin/flanneld"]

