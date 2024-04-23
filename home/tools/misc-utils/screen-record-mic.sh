#!/bin/bash

MIC=$(pactl get-default-source)
SPEAKERS=$(pactl get-default-sink).monitor
SPEAKERS_MIC=speakers_mic

if [ "${SPEAKERS}" = "${MIC}" ]; then
    echo "no microphone card detected"
    exit 1
fi

if ! pactl get-sink-mute $SPEAKERS_MIC &> /dev/null ; then
    echo "set simplescreenrecorder to ${SPEAKERS_MIC}.monitor"

    pactl load-module module-null-sink sink_name=speakers_mic &> /dev/null
    pactl load-module module-loopback source=${MIC} sink="${SPEAKERS_MIC}" latency_msec=1 &> /dev/null
    pactl load-module module-loopback source=${SPEAKERS} sink="${SPEAKERS_MIC}" latency_msec=1 &> /dev/null
    sed -i "s/audio_pulseaudio_source=.*/audio_pulseaudio_source=${SPEAKERS_MIC}.monitor/" ~/.ssr/settings.conf
else
    echo "set simplescreenrecorder to ${SPEAKERS}"

    pactl list short modules |grep ${SPEAKERS_MIC} | cut -f 1 |xargs -rL1 pactl unload-module &> /dev/null
    sed -i "s/audio_pulseaudio_source=.*/audio_pulseaudio_source=${SPEAKERS}/" ~/.ssr/settings.conf
fi
