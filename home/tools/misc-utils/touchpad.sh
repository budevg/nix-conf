#!/bin/sh
DEV=`xinput | sed -nre '/TouchPad/s/.*id=([0-9]*).*/\1/p'`
ENABLED=`xinput list-props $DEV | grep "Device Enabled" | cut -f3`
xinput set-prop $DEV "Device Enabled" $((1 - $ENABLED))
