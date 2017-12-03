# Bitcoind on a docker container
[![Docker Pulls](https://img.shields.io/docker/pulls/strm/bitcoind.svg?style=plastic)](https://hub.docker.com/r/strm/bitcoind/)

![logo](logo.png)

Bitcoind is a headless daemon, and also bundles a testing tool for the same daemon. It provides a JSON-RPC interface, allowing it to be controlled locally or remotely which makes it useful for integration with other software or in larger payment systems. Various commands are made available by the API.

## Example usage

You need to pass 2 parameters via environment variables if you want to access the API, `USER` and `PASSWORD`. Those will be necessary to connect to the bitcoin daemon. Inside the container, the blockchain will be stored at `/data/`, so is a good idea to put this directory in a volume or map to a directory in the host machine.

```
docker run \
  -e USER=user \
  -e PASSWORD=secret \
  -p 8332:8332 \
  -p 8333:8333 \
  -v "/blockchain:/data/" \
  strm/bitcoind
```
