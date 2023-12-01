#!/bin/bash

# set time to 31st October to play Pizza Tower pumpkin hunt

if [ "$1" ]; then
    if [ "$1" == "undo" ]; then
        sudo timedatectl set-ntp true
        echo "NTP re-enabled."
    else
        echo "Error: Unknown argument. Valid arguments: [undo]"
        exit 1
    fi
else
    if sudo timedatectl set-ntp false; then
        echo "NTP disabled."
        sudo timedatectl set-time "2023-10-31"
        echo "Time set to October 31st."
    fi
fi
