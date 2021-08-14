FROM golang:1.15.6-alpine3.12 AS builder
WORKDIR /tmp
ENV BUILD=/artifacts
RUN apk --no-cache update && \
    apk --no-cache upgrade && \
    apk --no-cache add make alpine-sdk gcc openssl libcurl git && \
    git clone https://github.com/STNS/STNS.git && \
    cd STNS/ && \
    mkdir -p $BUILD && \
    make install MODDIR=$BUILD BINDIR=$BUILD

FROM alpine:3.12
EXPOSE 1104/tcp
WORKDIR /stns
COPY --from=builder /artifacts /stns
COPY config.toml /config/
ENTRYPOINT ["/stns/stns", "--config", "/conf/config.toml", "server"]
