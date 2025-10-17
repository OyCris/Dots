# Dotfiles
I developed from the ground up to achieve one thing: a fast, clean, and absolutely distraction-free environment.  If you enjoy a workspace that is keyboard-driven, ultra-dark, and ruthlessly efficient, you'll find what you're looking for here.



# My Dot Files (Hyprland / Waybar / Rofi / Fish)

This repository contains the configuration files (dot files) for my Hyprland Wayland environment. It includes custom configs for Waybar, Rofi, Fastfetch, and the Fish shell, designed for speed and style.

## 🚀 Installation Guide

### Prerequisites

Before starting, please ensure you have the following packages installed on your Arch-based system:
* `hyprland` sudo pacman -S hyprland
* `waybar`   sudo pacman -Syu waybar
* `rofi`     sudo pacman -S rofi
* `fastfetch` sudo pacman -S fastfetch
* `fish` (Fish Shell) sudo pacman -S fish Or, if using an AUR helper: yay -S fish
* `starship` (For the terminal prompt) sudo pacman -S starship/ # go to fish config to add it in 
* *And any specific fonts/icons you use (e.g., Nerd Fonts).* 

---
-------------------------------------------------------------------------------------------------

### Step 1: Clone the Repository

Clone the repository into your home directory under the hidden folder `.dotfiles`.

```bash
git clone [https://github.com/OyCris/Dotfiles.git](https://github.com/OyCris/Dotfiles.git) ~/.dotfiles
cd ~/.dotfiles

# Make sure the script is executable (already done if you followed my guide)
# chmod +x install.sh 

# Run the script:
./install.sh

And done!




### 💀 Advanced Installation: Symlinking Manually (If You're Psycho)

If you prefer to know exactly what the `install.sh` script is doing (or if you are a true Arch Linux user who distrusts automation), here are the individual commands to create the symlinks for your configs.

**Note:** You MUST be in the `~/.dotfiles` directory for these to work, and you must manually delete or back up any existing config folders first!

```bash
# Navigate into the cloned repository
cd ~/.dotfiles

# -------------------------------------------------------------------------------------------------

# 1. Hyprland (The Window Manager Core)
ln -s ~/.dotfiles/hypr ~/.config/hypr

# 2. Waybar (The Status Bar)
ln -s ~/.dotfiles/waybar ~/.config/waybar

# 3. Rofi (The Application Launcher)
ln -s ~/.dotfiles/rofi ~/.config/rofi

# 4. Fastfetch (The Terminal Info Tool)
ln -s ~/.dotfiles/fastfetch ~/.config/fastfetch

# 5. Fish Shell (The Command Line Shell)
ln -s ~/.dotfiles/fish ~/.config/fish

# 6. Starship (The Prompt Config, if you included the .toml file)
# If you included your starship.toml file:
# ln -s ~/.dotfiles/starship.toml ~/.config/starship.toml 

# 7. Wallpapers (Non-.config directory link)
ln -s ~/.dotfiles/Wallpapers ~/Pictures/Wallpapers

# -------------------------------------------------------------------------------------------------
