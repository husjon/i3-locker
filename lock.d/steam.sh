#!/bin/bash

on_lock() {
    true
#   pkill ^steam
}

on_unlock() {
    true
#   nohup steam > /dev/null &
}

[[ "${BASH_SOURCE[0]}" == "${0}" ]] && on_$1
