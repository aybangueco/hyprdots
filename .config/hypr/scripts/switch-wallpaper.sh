#!/bin/bash

# Wallpaper Directory
WALLPAPER_DIR="$HOME/Pictures/Wallpapers/"

# Current wallpaper
CURRENT_WALL=$(hyprctl hyprpaper listloaded)

# Random wallpaper selections
WALLPAPER=$(find "$WALLPAPER_DIR" -type f ! -name "$(basename "$CURRENT_WALL")" | shuf -n 1)

# Set Wallpaper
# swww img "$WALLPAPER" --transition-type any --transition-fps 60 --transition-duration 1

notify-send -t 2000 "🎨 Wallpaper" "Setting new wallpaper..."
hyprctl hyprpaper reload ,"$WALLPAPER"

notify-send -t 2000 "🌈 Theme" "Applying pywal colors..."
wal -i $WALLPAPER # Set pywal colors

# Set active wallpaper
cp $WALLPAPER ~/Pictures/Wallpapers/active_wallpaper.jpg

notify-send -t 2000 "✅ Done" "Wallpaper and theme applied successfully."
