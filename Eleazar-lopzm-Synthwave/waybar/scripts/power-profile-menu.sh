#!/bin/bash
chosen=$(echo -e "performance\nbalanced\npower-saver" | rofi -dmenu -p "Select power profile:")

if [[ "$chosen" != "" ]]; then
  powerprofilesctl set "$chosen"
fi
