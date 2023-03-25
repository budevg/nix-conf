#!/bin/bash

dev=$(ls /dev/input/*/*-kbd | rofi -i -dmenu -p "Select keyboard device" -a 0 -no-custom)
config=`readlink -f ~/.config/kmonad/config.kbd`
sudo screen -d -m bash -c "sleep 1 && kmonad <(sed \"s|KBD_DEV|$dev|\" $config)"
