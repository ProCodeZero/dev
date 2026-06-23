#!/usr/bin/env bash
set -e
echo "Setting up Neovim configuration..."

NVIM_DIR="$HOME/.config/nvim"
REPO_URL="https://github.com/ProCodeZero/kickstart.nvim.git"

mkdir -p "$HOME/.config"

# 1. Check if it already exists and is the correct git repository
if [ -d "$NVIM_DIR/.git" ]; then
    CURRENT_URL=$(git -C "$NVIM_DIR" remote get-url origin 2>/dev/null || echo "")
    if [ "$CURRENT_URL" == "$REPO_URL" ]; then
        echo "✅ Neovim configuration is already installed. Pulling latest changes..."
        git -C "$NVIM_DIR" pull
        exit 0
    fi
fi

# 2. If it exists but is the wrong repo (or not a git repo), back it up
if [ -e "$NVIM_DIR" ] || [ -L "$NVIM_DIR" ]; then
    BACKUP_DIR="${NVIM_DIR}.bak.$(date +%Y%m%d%H%M%S)"
    echo "Existing nvim config found (different repo or not a git repo). Backing up to $BACKUP_DIR..."
    mv "$NVIM_DIR" "$BACKUP_DIR"
fi

# 3. Clone the kickstart.nvim repository
echo "Cloning kickstart.nvim from ${REPO_URL}..."
git clone "$REPO_URL" "$NVIM_DIR"

echo "✅ Neovim configuration installed successfully!"
