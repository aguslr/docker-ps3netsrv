[aguslr/docker-ps3netsrv][1]
============================

[![publish-docker-image](https://github.com/aguslr/docker-ps3netsrv/actions/workflows/docker-publish.yml/badge.svg)](https://github.com/aguslr/docker-ps3netsrv/actions/workflows/docker-publish.yml) [![docker-pulls](https://img.shields.io/docker/pulls/aguslr/ps3netsrv)](https://hub.docker.com/r/aguslr/ps3netsrv) [![image-size](https://img.shields.io/docker/image-size/aguslr/ps3netsrv/latest)](https://hub.docker.com/r/aguslr/ps3netsrv)


This *Docker* image sets up *PS3 Net Server* inside a docker container.

> **[PS3 Net Server][2]** is a network server that allows you to play backups of
> your PS3 games directly from the network.


Installation
------------

To use *docker-ps3netsrv*, follow these steps:

1. Clone and start the container:

       docker run -p 38008:38008 \
         -v "${PWD}"/games:/data docker.io/aguslr/ps3netsrv:latest

2. Connect from *webMAN-MOD* to your *PS3 Net Server*'s IP address on port
   `38008`.


Build locally
-------------

Instead of pulling the image from a remote repository, you can build it locally:

1. Clone the repository:

       git clone https://github.com/aguslr/docker-ps3netsrv.git

2. Change into the newly created directory and use `docker-compose` to build and
   launch the container:

       cd docker-ps3netsrv && docker-compose up --build -d


[1]: https://github.com/aguslr/docker-ps3netsrv
[2]: https://github.com/aldostools/webMAN-MOD/tree/master/_Projects_/ps3netsrv
