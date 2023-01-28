ARG BASE_IMAGE=debian:stable-slim

FROM docker.io/${BASE_IMAGE} AS builder

ARG PS3NETSRV_REPO=https://github.com/aldostools/webMAN-MOD
ARG PS3NETSRV_TAG=1.47.42

RUN \
  apt-get update && \
  env DEBIAN_FRONTEND=noninteractive \
  apt-get install -y --no-install-recommends \
  wget ca-certificates build-essential \
  -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" \
  && apt-get clean && rm -rf /var/lib/apt/lists/* /var/lib/apt/lists/*

WORKDIR /opt/ps3netsrv
RUN \
  wget ${PS3NETSRV_REPO}/archive/refs/tags/${PS3NETSRV_TAG}.tar.gz -O - \
  | tar -xzv --strip-components=3 \
  webMAN-MOD-${PS3NETSRV_TAG}/_Projects_/ps3netsrv && \
  chmod +x Make.sh && ./Make.sh


FROM docker.io/${BASE_IMAGE}

RUN \
  adduser --shell /sbin/nologin --gecos '' --disabled-password ps3netsrv

COPY --from=builder /opt/ps3netsrv/ps3netsrv /usr/local/bin

EXPOSE 38008/tcp

VOLUME /data

HEALTHCHECK --interval=1m --timeout=3s \
  CMD timeout 2 bash -c 'cat < /dev/null > /dev/tcp/127.0.0.1/38008'

USER ps3netsrv
ENTRYPOINT ["/usr/local/bin/ps3netsrv"]
CMD ["/data"]
