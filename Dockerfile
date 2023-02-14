FROM alpine:latest

WORKDIR /murmur

RUN VERSION=1.4.287-r0 && \
    apk --no-cache add murmur=${VERSION} su-exec gettext && \
    VERSION=

ADD murmur.*.ini /opt/
ADD start.sh /opt/

ENV DATA_VOLUME=/data
VOLUME ["${DATA_VOLUME}"]

EXPOSE 64738
EXPOSE 64738/udp

ENTRYPOINT ["/opt/start.sh"]
CMD ["default"]
