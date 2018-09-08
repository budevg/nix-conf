#!/bin/bash

while true; do
    for ext in mp3 m4a; do
        gcp ~/scratch/*.$ext ~/scratch/*/*.$ext .
    done
    sleep 30
done
