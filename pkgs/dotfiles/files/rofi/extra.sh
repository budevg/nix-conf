#!/bin/bash

declare -A CMDS
declare -A ICONS

CMDS["Shutdown"]="systemctl poweroff"
ICONS["Shutdown"]="system-shutdown"
CMDS["Reboot"]="systemctl reboot"
ICONS["Reboot"]="system-reboot"

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

    $CMD
    exit 0
fi
