#!/usr/bin/env bash

# Maximum allowed volume (in percent)
MAX_VOL=100

# Get current volume as float (0.00 - 1.00)
current_vol=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print $2}')

# Add 1% (0.01)
new_vol=$(echo "$current_vol + 0.02" | bc)

# Clamp to MAX_VOL (as 1.00)
max_vol_float=$(echo "$MAX_VOL / 100" | bc -l)

# If new volume exceeds max, set to max
if (( $(echo "$new_vol > $max_vol_float" | bc -l) )); then
    wpctl set-volume @DEFAULT_AUDIO_SINK@ "$max_vol_float"
else
    wpctl set-volume @DEFAULT_AUDIO_SINK@ 2%+
fi

