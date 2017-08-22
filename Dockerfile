FROM oberthur/docker-ubuntu:16.04-20170515 
MAINTAINER Lukasz Bielinski <l.bielinski@oberthur.com>

ENV FLANNEL_VERSION=v0.8.0

RUN apt-get update \
    && apt-get -y install iptables wget \

    # add flanneld
    && mkdir -p /opt/bin \
    && wget https://github.com/coreos/flannel/releases/download/${FLANNEL_VERSION}/flanneld-amd64 -O /opt/bin/flanneld --no-check-certificate \
    && chmod +x /opt/bin/flanneld \

    # clean up
    && apt-get remove wget \
    && apt-get clean autoclean \
    && apt-get autoremove --yes \
    && rm -rf /var/lib/{apt,dpkg,cache,log} 

CMD ["/opt/bin/flanneld"]

