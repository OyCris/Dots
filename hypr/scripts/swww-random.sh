#!/bin/bash

# --- Configuration ---
WALLPAPER_DIR="/home/oycris/Pictures/Wallpapers"
# Set the desired speed in seconds (e.g., 0.5 for half a second)
TRANSITION_DURATION=0.5
TRANSITION_TYPE=fade
# ---------------------

# Find a random image file in the directory, and set it with the duration
find "$WALLPAPER_DIR" -type f \
    | shuf -n 1 \
    | xargs swww img \
        --transition-type "$TRANSITION_TYPE" \
        --transition-duration "$TRANSITION_DURATION"
