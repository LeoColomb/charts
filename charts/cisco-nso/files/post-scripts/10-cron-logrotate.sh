#!/bin/bash

if [ "${LOGROTATE_ENABLE:-true}" = "true" ]; then
    echo "-> Enable log rotation"
    # logrotate refuses to use the config if it is writable by the world.
    # /etc/logrotate.d/ncs from NSO system install already comes with the
    # correct permissions, but if the users have replaced it with their own via
    # /extra-files then logrotate may silently fail for them.
    echo "--> Ensuring correct permissions"
    chmod 644 /etc/logrotate.d/ncs

    echo "--> Starting crond"
    crond
fi
