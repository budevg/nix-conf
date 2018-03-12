#!/bin/bash

function usage {
    echo "usage: $0 <command> <src> <dst>"
    echo "commands:"
    echo -e "\tnew - bind dst to location at src"
    echo -e "\tshadow  - overlay src to dst, bind dst to src"
    echo -e "\tdup - overlay src to dst"
    echo -e "\tclear - umount src and dst"
    exit 1
}

function new {
    local src=$1
    local dst=$2
    mkdir -p $dst
    sudo mount -o bind $dst $src
}

function shadow {
    local src=$1
    local dst=$2
    dup $src $dst
    sudo mount -o bind $dst/export $src
}

function dup {
    local src=$1
    local dst=$2
    mkdir -p $dst/upperdir $dst/workdir $dst/export
    sudo mount -t overlay overlay -olowerdir=$src -oupperdir=$dst/upperdir -oworkdir=$dst/workdir $dst/export
}

function clear {
    local src=$1
    local dst=$2
    test -d $src && sudo umount $src
    test -d $dst/export && sudo umount $dst/export
}

if [ $# -lt 3 ]; then usage; fi

set -x

case "$1" in
    new)
        new $2 $3
        ;;
    shadow)
        shadow $2 $3
        ;;
    dup)
        dup $2 $3
        ;;
    clear)
        clear $2 $3
        ;;
    *)
        usage
esac
