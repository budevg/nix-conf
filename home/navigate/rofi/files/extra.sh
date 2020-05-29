#!/bin/bash

declare -A CMDS
declare -A ICONS

CMDS["Shutdown"]="systemctl poweroff"
ICONS["Shutdown"]="system-shutdown"
CMDS["Reboot"]="systemctl reboot"
ICONS["Reboot"]="system-reboot"
CMDS["Scratch"]="xfce4-terminal -e scratch.sh"
ICONS["Scratch"]="harddrive"
CMDS["LowPower"]="xfce4-terminal -e low_power.sh "
ICONS["LowPower"]="display"

function cmds {
    for k in ${!CMDS[@]}; do
        printf "%s\0icon\x1f%s\n" $k ${ICONS[$k]}
    done
}

if [ -z "$1" ]; then
    cmds
else
    CMD=${CMDS[$1]}
    if [ -z "$CMD" ]; then
        exit 0
    fi

    eval $CMD > /dev/null &
    exit 0
fi
