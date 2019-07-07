#!/bin/bash

check_ssh_connection() {
    ss -nt | awk '{print $4}' | grep ':22' >/dev/null && return 0 || return 1
}

on_lock() {
    source ./lock

    LOCK_COUNT=0
    LOCK_DURATION=${LOCK_DURATION:-60}

    while $(check_locked); do
        ((LOCK_COUNT+=1))

        if [[ $LOCK_COUNT -ge $LOCK_DURATION ]]; then
            check_ssh_connection && ((LOCK_COUNT-=60))
            systemctl suspend
            LOCK_COUNT=0
        fi
    done
}

on_unlock() {
    true
}

[[ "${BASH_SOURCE[0]}" == "${0}" ]] && on_$1