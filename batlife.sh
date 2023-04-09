# !/bin/bash

# create a cron job to run batlife.sh at intervals
# * * * * *  XDG_RUNTIME_DIR=/run/user/$(id -u) /home/username/batlife.sh

BATTERY=$(cat /sys/class/power_supply/BAT0/capacity)
CHARGER_PLUGGED_IN=$(cat /sys/class/power_supply/AC/online)

if [ "$CHARGER_PLUGGED_IN" -eq 1 ] && [ "$BATTERY" -eq 100 ]; then
  notify-send  "Battery" "100% Charged"
fi
