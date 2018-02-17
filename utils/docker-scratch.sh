#!/bin/bash

set -x

USERNAME=`id -nu`
DOCKER_DATA=`readlink -f ~/scratch/docker`
# STORAGE=devicemapper
# STORAGE_OPTS="--storage-opt dm.basesize=20G"
STORAGE=overlay
STORAGE_OPTS=""


if [ ! -d $DOCKER_DATA ]
then
    mkdir $DOCKER_DATA
fi

if [ -f $DOCKER_DATA.pid ]
then
    echo docker already running pid `cat $DOCKER_DATA.pid`
    exit 1
fi

sudo PATH=$PATH screen -d -m dockerd --experimental -g $DOCKER_DATA -H unix://$DOCKER_DATA.sock -p $DOCKER_DATA.pid -s $STORAGE $STORAGE_OPTS $*
sleep 1
sudo chown $USERNAME:$USERNAME $DOCKER_DATA.sock
