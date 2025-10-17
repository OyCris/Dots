# Dotfiles Binds Are At The Bottom 
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

UNISTALL ALL CONFIGS BEFORE YOU INSTALL THIS ONE!!!!!
-------------------------------------------------------------------------------------------------

### Step 1: Clone the Repository

Clone the repository into your home directory under the hidden folder `.dotfiles`.

```bash
git clone clone https://github.com/OyCris/Dotfiles.git
cd ~/.dotfiles  

# Make sure the script is executable (already done if you followed my guide)
# chmod +x install.sh 

# Run the script:
./install.sh

And done!

but if that doesnt work and gives an error do this

mv Dotfiles ~/.dotfiles

# Change directory into the new, correct location
cd ~/.dotfiles

### ⚠️ Post-Installation: Wallpaper Troubleshooting (SUPER + W)

Due to a common timing issue with Hyprland and the `swww-daemon`, the wallpaper script might fail to run on initial login, resulting in the error: `"Socket file not found..."`.

If your wallpaper does not load on startup, or the `SUPER + W` binding only works after manually running the script once, you may need to increase the startup delay.

**How to Fix the Wallpaper Startup Delay:**

1.  **Open** your main Hyprland configuration file: `~/.config/hypr/hyprland.conf` 
2.  **Locate** the `### AUTOSTART ###` section.
3.  **Find** the line that executes the wallpaper script and increase the `sleep` value.

**Example of the line to change:**

| Original (May Fail) | Recommended (More Reliable) |
| :--- | :--- |
| `exec-once = sleep 1 && ~/.config/hypr/scripts/swww-random.sh` | `exec-once = sleep 4 && ~/.config/hypr/scripts/swww-random.sh` |

You may need to adjust the value (`4` seconds) higher or lower depending on the speed of your hardware. A value between `3` and `5` seconds is usually a safe and reliable choice.

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
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

# Binds

Function,Keybind,Command/Action,Notes
Launch Terminal,SUPER + RETURN,exec $terminal,
Launch App Menu,SUPER + D Rofi 
Close Window,SUPER + Q,killactive,
F11 Full screen
CTRL & ESC to select witch area to be screen shotted MAKE SURE to create a directory with the title ~/Pictures/Screenshots/ for captures to save correctly.
Random Wallpaper	SUPER + W	exec $wallpaper_script	(Working on it) It might randomize the same image; just keep pressing until you get a new one.
Switch Workspace,SUPER + [1-9],workspace [1-9],
Super + M Log Out of Hyprland
