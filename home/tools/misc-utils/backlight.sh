#!/bin/bash

MAX_BRIGHTNESS=`cat /sys/class/backlight/intel_backlight/max_brightness`
VAL=$1

if [ -z "$VAL" ]; then
    echo "usage: $0 <percent>"
    exit 1
fi

NEW_VAL=$((MAX_BRIGHTNESS * VAL / 100))
CMD="echo $NEW_VAL > /sys/class/backlight/intel_backlight/brightness"
set -x
sudo bash -c "$CMD"
