#!/usr/bin/env bash

# CRITICAL FIX: Use the ABSOLUTE path the symlink points to for Git compatibility.
# This ensures the script works on both your PC and laptop after symlinking.
WALLPAPER_DIR="/home/oycris/.dotfiles/Wallpapers"

# --- Main Logic ---

# 1. Use 'find' to locate wallpaper files, handling spaces in names.
find "$WALLPAPER_DIR" -maxdepth 1 -type f \
    \( -name "*.jpg" -o -name "*.png" -o -name "*.jpeg" \) \
| while IFS= read -r FULL_PATH; do
    FILENAME=$(basename "$FULL_PATH")
    # Format the output for Rofi: FILENAME\0icon\x1fFULL_PATH\n
    printf "%s\0icon\x1f%s\n" "$FILENAME" "$FULL_PATH"
done \
| rofi -dmenu \
       -i \
       -lines 1 \
       -config "$HOME/.config/rofi/wallpaper.rasi" \
       -p "Wallpaper" \
       -no-custom \
| while IFS= read -r SELECTED_FILENAME; do
    if [ -n "$SELECTED_FILENAME" ]; then
        # Reconstruct the full path using the absolute WALLPAPER_DIR
        FULL_WALLPAPER_PATH="$WALLPAPER_DIR/$SELECTED_FILENAME"
        
        # FINAL TRANSITION: Using 'wipe' at a slow, smooth speed (step 100)
        exec bash -c "swww img \"$FULL_WALLPAPER_PATH\" --transition-type wipe --transition-step 100 &"
    fi
done

exit 0
