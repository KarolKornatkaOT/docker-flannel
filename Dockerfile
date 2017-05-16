FROM oberthur/docker-ubuntu:16.04
MAINTAINER Lukasz Bielinski <l.bielinski@oberthur.com>

ENV _FLANNEL_VERSION=v0.7.1

RUN apt-get update \
    && apt-get -y install iptables \
    && apt-get clean autoclean \
    && apt-get autoremove --yes \
    && rm -rf /var/lib/{apt,dpkg,cache,log} \
    && curl -L https://github.com/coreos/flannel/releases/download/${_FLANNEL_VERSION}/flanneld-amd64 -o /opt/bin/flanneld

CMD ["/usr/local/bin/flanneld"]

