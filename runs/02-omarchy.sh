#!/usr/bin/env bash
set -e
echo "Copying Omarchy Hyprland bindings..."

# Ensure the target directory exists
TARGET_DIR="$HOME/.local/share/omarchy/default/hypr/bindings"
mkdir -p "$TARGET_DIR"

# Copy WITHOUT sudo so the files are owned by your user
# Excluding the deprecated tiling.conf to prevent binding conflicts
find ${PWD}/bindings -type f ! -name "tiling.conf" -exec cp {} "$TARGET_DIR/" \;

echo "Bindings copied successfully."
