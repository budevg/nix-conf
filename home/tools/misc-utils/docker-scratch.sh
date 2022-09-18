#!/bin/bash

set -x

ROOT=`readlink -f ${1-~/scratch}`
USERNAME=`id -nu`
DOCKER_DATA="$ROOT/docker"
DEFAULT_DOCKER_SOCK="/var/run/docker.sock"
# STORAGE=devicemapper
# STORAGE_OPTS="--storage-opt dm.basesize=20G"
STORAGE=overlay
STORAGE_OPTS=""


if [ ! -d $DOCKER_DATA ]
then
    mkdir -p $DOCKER_DATA
fi

if [ -f $DOCKER_DATA.pid ]
then
    echo docker already running pid `cat $DOCKER_DATA.pid`
    exit 1
fi

sudo PATH=$PATH screen -d -m dockerd --experimental -g $DOCKER_DATA -H unix://$DOCKER_DATA.sock -p $DOCKER_DATA.pid -s $STORAGE $STORAGE_OPTS
sleep 5
sudo chown $USERNAME:$USERNAME $DOCKER_DATA.sock
sudo umount $DEFAULT_DOCKER_SOCK || true
sudo touch $DEFAULT_DOCKER_SOCK
sudo mount -o bind $DOCKER_DATA.sock $DEFAULT_DOCKER_SOCK
