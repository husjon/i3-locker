#!/bin/bash

on_lock() {
    true
}

on_unlock() {
    systemctl --user restart synology_drive.service
}

[[ "${BASH_SOURCE[0]}" == "${0}" ]] && on_$1
