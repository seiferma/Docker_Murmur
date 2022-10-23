FROM alpine:3.16

WORKDIR /murmur

RUN VERSION=1.4.230-r4 && \
    apk --no-cache add murmur=${VERSION} su-exec gettext && \
    VERSION=

ADD murmur.*.ini /opt/
ADD start.sh /opt/

ENV DATA_VOLUME=/data
RUN mkdir -p ${DATA_VOLUME} && \
    chown murmur:murmur ${DATA_VOLUME}

EXPOSE 64738
EXPOSE 64738/udp

ENTRYPOINT ["/opt/start.sh"]
CMD ["default"]
