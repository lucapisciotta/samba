#!/usr/bin/env bash

if [ -n "${EXTRA_PID}" ]; then
    useradd -M -d /media/storage -u "${EXTRA_PID}" -G nogroup,sambashare guestuser
fi

smbd -F --no-process-group -S