#!/bin/bash

check_ssh_connection() {
    ss -nt | awk '{print $4}' | grep ':22' >/dev/null && return 0 || return 1
}
is_night() {
    CURRENT_HOUR=$(date +%H)
    if [ "$CURRENT_HOUR" -ge 1 ] && [ "$CURRENT_HOUR" -le 7 ]; then
        return 0
    else
        return 1
    fi
}

on_lock() {
    source ./lock

    LOCK_COUNT=0
    LOCK_DURATION=${LOCK_DURATION:-60}

    while $(check_locked); do
        check_ssh_connection && LOCK_COUNT=0
        is_night || LOCK_COUNT=0

        if [[ $LOCK_COUNT -ge $LOCK_DURATION ]]; then
            systemctl suspend
            LOCK_COUNT=0
        fi

        ((LOCK_COUNT+=1))
    done
}

on_unlock() {
    true
}

[[ "${BASH_SOURCE[0]}" == "${0}" ]] && "on_$1"
