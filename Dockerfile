FROM alpine:latest

WORKDIR /murmur

RUN VERSION=1.3.0-r0 && \
    apk --no-cache add murmur=${VERSION} && \
    VERSION=

COPY ["murmur.ini", "start.sh", "./"]

ENV DATA_VOLUME=/data
RUN mkdir -p ${DATA_VOLUME} && \
    chown murmur:murmur ${DATA_VOLUME}

USER murmur

EXPOSE 64738
EXPOSE 64738/udp

ENTRYPOINT ["./start.sh"]
CMD ["default"]
