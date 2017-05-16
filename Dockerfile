FROM oberthur/docker-ubuntu:16.04
MAINTAINER Lukasz Bielinski <l.bielinski@oberthur.com>

ENV FLANNEL_VERSION=v0.7.1

RUN apt-get update \
    && apt-get -y install iptables \

    # clean up
    && apt-get clean autoclean \
    && apt-get autoremove --yes \
    && rm -rf /var/lib/{apt,dpkg,cache,log} \

    # add flanneld
    && mkdir -p /opt/bin \
    && curl -L https://github.com/coreos/flannel/releases/download/${FLANNEL_VERSION}/flanneld-amd64 -o /opt/bin/flanneld \
    && chmod +x /opt/bin/flanneld

CMD ["/opt/bin/flanneld"]

