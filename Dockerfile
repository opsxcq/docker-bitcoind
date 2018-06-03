FROM debian:sid

LABEL maintainer "opsxcq@strm.sh"

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
    bitcoind \
    bitcoin-tx \
    xcb \
    && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN useradd --system --uid 666 -M --shell /usr/sbin/nologin bitcoind && \
    touch /etc/bitcoind.conf && \
    chown bitcoind:bitcoind /etc/bitcoind.conf && \
    mkdir /data /home/bitcoind && \
    chown -R bitcoind:bitcoind /data /home/bitcoind
USER bitcoind

# API Ports
EXPOSE 8332 
EXPOSE 8333

VOLUME /data

COPY main.sh /
ENTRYPOINT ["/main.sh"]

