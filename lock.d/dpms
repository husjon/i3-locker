#!/bin/bash

x_idle() {
    echo $(( $(xssstate -i) / 1000 ))
}

DPMS_STANDBY=10
DPMS_SUSPEND=20
DPMS_OFF=120

on_lock() {
    source ./lock

    # xset dpms ${DPMS_STANDBY} ${DPMS_SUSPEND} ${DPMS_OFF}

    while $(check_locked); do
        if (( $(x_idle) > ${DPMS_OFF} )); then
            xset dpms force off
        elif (( $(x_idle) > ${DPMS_SUSPEND} )); then
            xset dpms force suspend
        elif (( $(x_idle) > ${DPMS_STANDBY} )); then
            xset dpms force standby
        fi
        sleep 1
    done
}

on_unlock() {
    xset -dpms
}

[[ "${BASH_SOURCE[0]}" == "${0}" ]] && on_$1
