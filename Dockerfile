FROM golang:1.17.0-alpine3.14 AS builder
WORKDIR /tmp
ENV BUILD=/artifacts
RUN apk --no-cache update && \
    apk --no-cache upgrade && \
    apk --no-cache add make alpine-sdk gcc openssl libcurl git && \
    git clone https://github.com/STNS/STNS.git && \
    cd STNS/ && \
    mkdir -p $BUILD && \
    make install MODDIR=$BUILD BINDIR=$BUILD

FROM alpine:3.14
EXPOSE 1104/tcp
WORKDIR /stns
COPY --from=builder /artifacts /stns
COPY config.toml /config/
ENTRYPOINT ["/stns/stns", "--config", "/conf/config.toml", "server"]
