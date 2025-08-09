#!/bin/bash

# Define wallpaper directory
WALLPAPER_DIR="$HOME/Pictures/Wallpapers"
ACTIVE_WALL="$WALLPAPER_DIR/active_wallpaper.jpg"
HYPAPER_CONF="$HOME/.config/hypr/hyprpaper.conf"

# Get current wallpaper (assumes it's active_wallpaper.jpg)
CURRENT_WALL=$(basename "$ACTIVE_WALL")

# Pick a new random wallpaper (excluding current)
NEW_WALL=$(find "$WALLPAPER_DIR" -type f \( -iname '*.jpg' -o -iname '*.png' \) ! -name "$(basename "$CURRENT_WALL")" | shuf -n 1)

# Exit if no new wallpaper found
if [[ -z "$NEW_WALL" ]]; then
    notify-send -u critical "Wallpaper Error" "No other wallpapers found."
    exit 1
fi

# Update hyprpaper.conf
echo "preload = $NEW_WALL" > "$HYPAPER_CONF"
echo "wallpaper = ,$NEW_WALL" >> "$HYPAPER_CONF"

# Reload wallpaper
notify-send -t 2000 "🎨 Wallpaper" "Setting new wallpaper..."
hyprctl hyprpaper reload ,"$NEW_WALL"

# Apply pywal theme
notify-send -t 2000 "🌈 Theme" "Applying pywal colors..."
wal -i "$NEW_WALL"

notify-send -t 2000 "✅ Done" "Wallpaper and theme applied successfully."

