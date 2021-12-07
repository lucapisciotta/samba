FROM ubuntu:21.04

ARG TZ=Europe/Rome
ENV TZ=${TZ}
ENV DEBIAN_FRONTEND=noninteractive

RUN set -ue \
    ; ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone \
    ; apt-get update \
    ; apt-get -y upgrade \
    ; apt-get install -y \
        libjansson4 \
        samba \
    ; mkdir /media/storage \
    ; chmod 0777 /media/storage \
;

COPY ./smb.conf /etc/samba/smb.conf

EXPOSE 445/tcp

ENTRYPOINT ["smbd", "-F", "--no-process-group", "-S"]