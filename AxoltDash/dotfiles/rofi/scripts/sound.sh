#!/bin/bash

options=(
    "LAPTOP"
    "TV"
    "Kill PICOM"
    "Start PICOM"
)

choice=$(printf "%s\n" "${options[@]}" | rofi -dmenu -i -p "Displays :")

case "$choice" in
    "LAPTOP")
        nohup pactl set-default-sink alsa_output.pci-0000_03_00.6.analog-stereo >/dev/null 2>&1 &
        ;;
    "TV")
        nohup pactl set-default-sink alsa_output.pci-0000_03_00.1.hdmi-stereo >/dev/null 2>&1 &
        ;;
    "Kill PICOM")
        nohup pkill picom >/dev/null 2>&1 &
        ;;
    "Start PICOM")
        nohup picom >/dev/null 2>&1 &
        ;;
esac
