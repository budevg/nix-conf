#!/bin/sh
SCRATCH_PATH=`readlink -f ~/scratch`
SIZE=${1-4G}

if mountpoint -q $SCRATCH_PATH; then
    sudo mount -o remount,size=$SIZE $SCRATCH_PATH
else
    sudo mount -t tmpfs -o size=$SIZE none $SCRATCH_PATH
fi
