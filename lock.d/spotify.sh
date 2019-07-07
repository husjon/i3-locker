#!/bin/bash

on_lock() {
    true
#   pkill ^spotify
}

on_unlock() {
    true
#   nohup spotify &
}

[[ "${BASH_SOURCE[0]}" == "${0}" ]] && on_$1
