#!/bin/bash

if ping -c 1 google.com &> /dev/null; then
    notify-send -u critical "Network" "Back online"
fi
