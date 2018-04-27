#!/bin/sh
VAL=`synclient -l |grep TouchpadOff |awk '{print $3}'`
NEW_VAL=$((1-$VAL))
echo synclient TouchpadOff=$NEW_VAL
synclient TouchpadOff=$NEW_VAL
