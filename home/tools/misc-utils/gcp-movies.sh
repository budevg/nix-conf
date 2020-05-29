#!/bin/bash

while true; do
    for ext in avi mp4 mkv ; do
        gcp ~/scratch/*.$ext ~/scratch/*/*.$ext .
    done
    sleep 30
done
