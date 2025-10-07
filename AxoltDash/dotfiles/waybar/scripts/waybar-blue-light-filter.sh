#!/usr/bin/env bash

STATE_FILE="/tmp/waybar_blue_light_filter_state"
LOG_FILE="/tmp/waybar_blue_light_filter.log"

echo "Script ejecutado a las $(date)" >> "$LOG_FILE"

if [ -f "$STATE_FILE" ]; then
    CURRENT_STATE=$(cat "$STATE_FILE")
else
    CURRENT_STATE="OFF"
fi

if [ "$CURRENT_STATE" = "OFF" ]; then
    echo "Activando filtro..." >> "$LOG_FILE"
    hyprshade on blue-light-filter
    echo "ON" > "$STATE_FILE"
    echo '{"text": "ON", "class": "enabled"}'
else
    echo "Desactivando filtro..." >> "$LOG_FILE"
    hyprshade off
    echo "OFF" > "$STATE_FILE"
    echo '{"text": "OFF", "class": "disabled"}'
fi
