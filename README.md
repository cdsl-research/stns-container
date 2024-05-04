# stns-container

[![Create and publish a Docker image](https://github.com/cdsl-research/stns-container/actions/workflows/image-build.yml/badge.svg)](https://github.com/cdsl-research/stns-container/actions/workflows/image-build.yml)

STNS Server

> [!WARNING]
> This container image will be deprecated because STNS official container image supported multiple layer builds.
> See also: https://github.com/cdsl-research/stns-container/issues/13

## Usage

Create a single container by docker command

```
# edit stns server config
nano config.toml

# create a container
docker run -d -p 1104:1104 -v $PWD:/conf ghcr.io/cdsl-research/stns-container:<tag>

# access to stns server
curl localhost:1104
```

[Deploy on Kubernetes](kubernetes/README.md)

## Develop

Build container

```
make build
```

Push container

```
make push
```

