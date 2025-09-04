#!/usr/bin/env bash

# Wait for swww-daemon to be ready
until swww query; do
    sleep 0.5
done

# Directory containing wallpapers
WALLPAPER_DIR="$HOME/.mynixos/home/dotfiles/fractal-rice/backgrounds"

# Interval in seconds
INTERVAL=300

# Infinite loop
while true; do
    # Loop through each image in the directory
    for img in "$WALLPAPER_DIR"/*.png; do
        # Set the wallpaper
        swww img "$img" --transition-type center --transition-duration 4 --resize fit
        # Wait for the interval before changing again
        sleep "$INTERVAL"
    done
done
