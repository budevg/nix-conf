#!/bin/bash

function usage {
    echo "usage: $0 <command> <src> [dst]"
    echo "commands:"
    echo -e "\tmask - bind dst to location at src"
    echo -e "\texpose - bind src to location at dst"
    echo -e "\tshadow  - overlay src to dst, bind dst to src"
    echo -e "\tdup - overlay src to dst"
    echo -e "\tclear - umount script-created mounts"
    exit 1
}

function log {
    printf 'dir-scratch: %s\n' "$*" >&2
}

function default_dst {
    local src=$1
    local dst="./$(basename -- "$src")"
    local real_src=$(realpath -m -- "$src")
    local real_dst=$(realpath -m -- "$dst")

    if [ "$real_src" = "$real_dst" ]; then
        echo "$0: refusing default dst '$dst': it resolves to the same path as src '$src'" >&2
        echo "$0: provide an explicit dst outside the source directory" >&2
        return 1
    fi

    printf '%s\n' "$dst"
}

function overlay_state_dir {
    local dst=$1
    local dst_dir=$(dirname -- "$dst")
    local dst_base=$(basename -- "$dst")

    case "$dst_base" in
        .|..|/)
            echo "$0: invalid overlay destination '$dst'" >&2
            return 1
            ;;
    esac

    printf '%s/.%s\n' "$dst_dir" "$dst_base"
}

function mask {
    local src=$1
    local dst=$2
    mkdir -p "$dst"
    log "bind $dst -> $src"
    sudo mount -o bind "$dst" "$src"
}

function expose {
    local src=$1
    local dst=$2
    mkdir -p "$dst"
    log "bind $src -> $dst"
    sudo mount -o bind "$src" "$dst"
}

function shadow {
    local src=$1
    local dst=$2
    dup "$src" "$dst" || return
    log "bind $dst -> $src"
    sudo mount -o bind "$dst" "$src"
}

function dup {
    local src=$1
    local dst=$2
    local state_dir

    state_dir=$(overlay_state_dir "$dst") || return
    mkdir -p "$state_dir/upperdir" "$state_dir/workdir" "$dst"
    log "overlay lower=$src upper=$state_dir/upperdir -> $dst"
    sudo mount -t overlay overlay -olowerdir="$src" -oupperdir="$state_dir/upperdir" -oworkdir="$state_dir/workdir" "$dst"
}

function umount_if_mounted {
    local target=$1

    if mountpoint -q -- "$target"; then
        log "umount $target"
        sudo umount "$target"
    fi
}

function clear {
    local src=$1
    local dst=$2
    local status=0
    local state_dir

    src=$(realpath -m -- "$src")
    dst=$(realpath -m -- "$dst")

    # src first (topmost layer in shadow's bind-over-overlay stack), then dst.
    umount_if_mounted "$src" || status=1
    umount_if_mounted "$dst" || status=1

    state_dir=$(overlay_state_dir "$dst" 2>/dev/null) || return "$status"
    if [ -d "$state_dir" ]; then
        printf 'note: overlay state preserved at %s\n' "$state_dir" >&2
    fi

    return "$status"
}

function main {
    if [ $# -lt 2 ] || [ $# -gt 3 ]; then usage; fi

    local cmd=$1
    local src=$2
    local dst

    case "$cmd" in
        mask|expose|shadow|dup|clear)
            ;;
        *)
            usage
    esac

    if [ $# -eq 3 ]; then
        dst=$3
    else
        dst=$(default_dst "$src") || exit 1
    fi

    case "$cmd" in
        mask)
            mask "$src" "$dst"
            ;;
        expose)
            expose "$src" "$dst"
            ;;
        shadow)
            shadow "$src" "$dst"
            ;;
        dup)
            dup "$src" "$dst"
            ;;
        clear)
            clear "$src" "$dst"
            ;;
    esac
}

main "$@"
