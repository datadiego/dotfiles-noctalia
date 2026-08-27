#!/bin/bash

MODE_FILE="$HOME/.config/hypr/monitor_mode"

# Create default if doesn't exist
if [ ! -f "$MODE_FILE" ]; then
    echo "scale" > "$MODE_FILE"
fi

CURRENT=$(cat "$MODE_FILE")

if [ "$CURRENT" = "scale" ]; then
    echo "mirror" > "$MODE_FILE"
else
    echo "scale" > "$MODE_FILE"
fi

# Reload hyprland config
hyprctl reload
