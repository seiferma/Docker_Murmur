FROM alpine:latest

ARG VERSION

WORKDIR /murmur

RUN apk upgrade --no-cache && \
    apk --no-cache add murmur=${VERSION} su-exec gettext

ADD murmur.*.ini /opt/
ADD start.sh /opt/

ENV DATA_VOLUME=/data
VOLUME ["${DATA_VOLUME}"]

EXPOSE 64738
EXPOSE 64738/udp

ENTRYPOINT ["/opt/start.sh"]
CMD ["default"]
