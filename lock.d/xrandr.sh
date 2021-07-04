#!/bin/bash

on_lock() {
    true
}

on_unlock() {
    ~/.local/share/xinitrc.d/10-xrandr-monitors.sh
}

[[ "${BASH_SOURCE[0]}" == "${0}" ]] && on_$1
