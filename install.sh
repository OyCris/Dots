#!/bin/bash

# =========================================================
# INSTALLATION SCRIPT FOR MAX FTW DOT FILES
# This script symlinks all config folders to their correct
# locations in ~/.config/
# =========================================================

DOTFILES_DIR="$HOME/.dotfiles"

echo "Starting installation of max ftw dot files..."

# ---------------------------------------------------------
# 1. Create .config directories if they don't exist
# ---------------------------------------------------------
echo "Creating necessary ~/.config directories..."
mkdir -p "$HOME/.config"

# ---------------------------------------------------------
# 2. Function to create a symlink
#    -f flag forces the symlink creation, overwriting existing links
# ---------------------------------------------------------
create_symlink() {
    local source_path="$DOTFILES_DIR/$1"
    local dest_path="$HOME/.config/$1"
    
    # Check if the source file/directory exists in the repo
    if [ -e "$source_path" ]; then
        # Check if the destination is a normal file/directory and warn the user
        if [ -d "$dest_path" ] && [ ! -L "$dest_path" ]; then
            echo "⚠️  WARNING: Existing directory found at $dest_path. Back up or remove it manually."
        elif [ -f "$dest_path" ] && [ ! -L "$dest_path" ]; then
            echo "⚠️  WARNING: Existing file found at $dest_path. Back up or remove it manually."
        else
            # Create the symlink, -f forces overwrite of existing symlinks
            ln -sfn "$source_path" "$dest_path"
            echo "✅ Created symlink: $dest_path"
        fi
    else
        echo "❌ Source not found: $source_path (Skipping)"
    fi
}

# ---------------------------------------------------------
# 3. Create Symlinks for Core Configurations
#    Argument 1 is the folder/file name inside the .dotfiles repo
# ---------------------------------------------------------

# Hyprland
create_symlink "hypr"

# Waybar
create_symlink "waybar"

# Rofi
create_symlink "rofi"

# Fastfetch
create_symlink "fastfetch"

# Fish Shell
create_symlink "fish"

# Starship (Uncomment if you added starship.toml to ~/.dotfiles/starship.toml)
# create_symlink "starship.toml" "$HOME/.config/starship.toml"


# ---------------------------------------------------------
# 4. Handle Non-.config Files (e.g., Wallpapers)
# ---------------------------------------------------------
echo "Linking non-.config files..."
WALLPAPER_SOURCE="$DOTFILES_DIR/Wallpapers"
WALLPAPER_DEST="$HOME/Pictures/Wallpapers"

if [ -d "$WALLPAPER_SOURCE" ]; then
    ln -sfn "$WALLPAPER_SOURCE" "$WALLPAPER_DEST"
    echo "✅ Linked Wallpapers to: $WALLPAPER_DEST"
else
    echo "❌ Wallpapers source not found: $WALLPAPER_SOURCE (Skipping)"
fi


echo "========================================================="
echo "Installation complete! Please install all required packages."
echo "========================================================="
