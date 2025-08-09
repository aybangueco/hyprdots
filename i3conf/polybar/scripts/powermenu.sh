#!/bin/bash

# You can use rofi or dmenu for the menu. Here's an example with rofi:
chosen=$(printf "Shutdown\nReboot\nSuspend\nLogout\nLock\nCancel" | rofi -dmenu -i -p "Power Menu")

case "$chosen" in
  Shutdown) systemctl poweroff ;;
  Reboot) systemctl reboot ;;
  Suspend) systemctl suspend ;;
  Logout) i3-msg exit ;;   # Adjust if you use another WM
  Lock) i3lock ;;         # Adjust lock command as needed
  *) exit 0 ;;
esac
