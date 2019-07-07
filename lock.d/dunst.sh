#!/bin/bash

on_lock() {
    pkill ^dunst$ -USR1 >/dev/null # pause
}

on_unlock() {
    pkill ^dunst$ -USR2 # resume
}

[[ "${BASH_SOURCE[0]}" == "${0}" ]] && on_$1
