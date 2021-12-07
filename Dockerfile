FROM ubuntu:21.04

RUN set -ue \
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