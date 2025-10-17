#!/bin/bash

# --- CONFIGURATION ---
WALLPAPER_DIR=~/Pictures/Wallpapers/
# Ensure this directory exists and has image files!

# --- SCRIPT ---

# 1. List all image files in the WALLPAPER_DIR, piping to Rofi.
WALLPAPER_PATH=$(find "$WALLPAPER_DIR" -type f \
    -exec sh -c 'file -b --mime-type "$0" | grep -q "^image/" && echo "$0"' {} \; 2>/dev/null | \
    rofi -dmenu -i -p "Select Wallpaper" -sort -matching fuzzy)

# Check if a wallpaper was selected
if [ -n "$WALLPAPER_PATH" ]; then
    # 2. Use swww to set the selected wallpaper with an animation.
    swww img "$WALLPAPER_PATH" --transition-type "rand" --transition-fps 60

    # 3. Save the chosen wallpaper path to a file for Hyprland to load on startup.
    echo "export WALLPAPER_PATH=$WALLPAPER_PATH" > ~/.config/hypr/hyprland_wallpaper
fi
