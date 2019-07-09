# VERSION 0.12.3-2
FROM anapsix/alpine-java:8_server-jre_unlimited

MAINTAINER TalkWithKeyboard <songwei@ruguoapp.com>
# Forked from https://github.com/maver1ck/druid-docker

ENV DRUID_VERSION  0.14.2
ENV DRUID_MODULE -

RUN apk update \
    && apk add --no-cache bash curl \
    && mkdir /tmp/druid \
    && curl http://apache.01link.hk/incubator/druid/$DRUID_VERSION-incubating/apache-druid-$DRUID_VERSION-incubating-bin.tar.gz | tar -xzf - -C /opt \
    && ln -s /opt/apache-druid-$DRUID_VERSION-incubating-bin /opt/druid

COPY conf /opt/druid/conf
COPY start-druid.sh /start-druid.sh
CMD /start-druid.sh $DRUID_MODULE