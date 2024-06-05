#!/bin/bash

# create a cron job to run batlife.sh at intervals
# * * * * *  XDG_RUNTIME_DIR=/run/user/$(id -u) /home/username/batlife.sh

BATTERY=$(cat /sys/class/power_supply/BAT0/capacity)
CHARGER_PLUGGED_IN=$(cat /sys/class/power_supply/AC/online)

notify() {
  notify-send "Battery" "$1"
  if [ -f /usr/share/sounds/sound-icons/prompt.wav ]; then
      aplay /usr/share/sounds/sound-icons/prompt.wav
  else
      paplay /usr/share/sounds/freedesktop/stereo/message-new-instant.oga
  fi
}

if [ "$CHARGER_PLUGGED_IN" -eq 1 ] && [ "$BATTERY" -eq 100 ]; then
  notify "100% Charged"
elif [ "$CHARGER_PLUGGED_IN" -eq 0 ] && [ "$BATTERY" -lt 25 ]; then
  notify "Below 25%"
fi

