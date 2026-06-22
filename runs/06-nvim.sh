#!/usr/bin/env bash
echo "Linking Neovim configuration..."

# Assuming your nvim config is in a subfolder or you clone it here
# If it's already in ~/.config/nvim, you can skip this or adjust the path.
NVIM_SRC="$(pwd)/nvim" # Adjust if your nvim config is elsewhere
if [ -d "$NVIM_SRC" ]; then
    ln -sfn "$NVIM_SRC" ~/.config/nvim
fi
