#!/bin/bash

if ! pkill simplesc; then
    screen -d -m simplescreenrecorder --start-hidden --start-recording
fi
