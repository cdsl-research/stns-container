FROM golang:1.17.0-alpine3.14 AS builder
WORKDIR /tmp
ENV BUILD=/artifacts
RUN apk --no-cache update
RUN apk --no-cache upgrade
RUN apk --no-cache add make alpine-sdk gcc openssl libcurl git
RUN git clone https://github.com/STNS/STNS.git
WORKDIR /tmp/STNS
RUN mkdir -p $BUILD
RUN make install MODDIR=$BUILD BINDIR=$BUILD

FROM alpine:3.14
EXPOSE 1104/tcp
WORKDIR /stns
COPY --from=builder /artifacts /stns
ENTRYPOINT ["/stns/stns"]
CMD ["--config", "/conf/config.toml", "server"]
