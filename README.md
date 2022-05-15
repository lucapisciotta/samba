# lucapisciotta/samba
[![CI](https://github.com/lucapisciotta/samba/actions/workflows/main.yml/badge.svg)](https://github.com/lucapisciotta/samba/actions/workflows/main.yml)
![Docker Pulls](https://img.shields.io/docker/pulls/lucapisciotta/samba)
![GitHub](https://img.shields.io/github/license/lucapisciotta/samba)
------------------------
[Samba](https://www.samba.org/) is the standard Windows interoperability suite of programs for Linux and Unix.
With this image you will have a simple network share reachable from Windows, OSX and Linux machines.


The image is based on the official ubuntu:21.04 and the offical samba package that you can find in the ubuntu repository.

### Supported architectures
------------------------
This image supports different architecture: `linux/amd64`, `linux/arm64`, `linux/arm/v7`.

### Application Setup
------------------------
The setup is more than simple, you can simply run the docker and reach it using its IP on the standard smb port (`445`).
Here you can find a simple network share and you can put your files here to test it but take in mind that you need to define a volume to mantain them when container stops.

### Usage
------------------------
Here are some example snippets to help you get started creating a container.

**docker-compose**
```
---
version: '3.8'
services:
    samba:
        image: lucapisciotta/samba
        container_name: samba
        environment:
            - TZ=Europe/Rome
        volumes:
            - /path/to/your/local/files/:/media/storage
            - /path/to/your/custom/smb.conf:/etc/samba  # Optional
        ports:
            - 445:445
        restart: unless-stopped
```
**docker-cli**
```
docker run -d \
    --name=samba \
    -p 445:445 \
    -p 139:139 \
    -v /path/to/your/local/files/:/media/storage \
    --restart unless-stopped \
    lucapisciotta/samba
```
### Parameters
------------------------
Container images are configured using parameters passed at runtime (such as those above). These parameters are separated by a colon and indicate <external>:<internal> respectively. For example, -p 8080:80 would expose port 80 from inside the container to be accessible from the host's IP on port 8080 outside the container.
| Parameter | Function |
| :---: | :---: |
|`-p 445:445` | SMB port. |
|`-p 139:139` | NetBIOS port. |
|`-e TZ=Europe/Rome` |	Specify a timezone to use EG Europe/Rome. |
|`-v /path/to/your/local/files/:/media/storage` | Where your preexisting files are located. |


### Sources
------------------------
Docker image repository: https://github.com/lucapisciotta/samba