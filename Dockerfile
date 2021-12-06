FROM alpine:3.15

RUN set -ue \
    ; apk update \
    ; apk upgrade \
    ; apk add samba \
    ; mkdir /media/storage \
    ; chmod 0777 /media/storage \
;

COPY ./smb.conf /etc/samba/smb.conf

EXPOSE 445/tcp

ENTRYPOINT ["smbd", "-F", "--no-process-group"]