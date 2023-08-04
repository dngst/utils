#!/bin/bash

wget -q --spider http://google.com

if [ $? -eq 0 ]; then
    notify-send -u critical "Network" "Online"
else
    notify-send -u critical "Network" "Offline"
fi
