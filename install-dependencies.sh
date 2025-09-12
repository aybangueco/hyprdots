#!/bin/bash

echo "Installing dependencies..."
echo "PS: This installation script assumes you have yay installed!"


# List of packages to install
packages=(
  fastfetch
  htop
  btop
  waybar
  kitty
  thunar
  python-pywal16
  python-pywalfox
  wofi
  hypridle
  hyprlock
  hyprshot
  hyprpaper
  playerctl
  nwg-look
  brightnessctl
  hyprpolkitagent
  orage
  swaync
  network-manager-applet
  blueman-applet
  ttf-jetbrains-mono-nerd
  ttf-roboto-mono-nerd
  ttf-fira-code
  gvfs
  lazygit
  neovim
)

yay -S --needed --noconfirm "${packages[@]}"

echo "All packages installed!"
