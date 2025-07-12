#!/bin/bash

config=`readlink -f ~/.config/kanata/config.kbd`
sudo env PATH=$PATH screen -d -m bash -c "sleep 1 && kanata -c $config"
