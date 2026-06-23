#!/usr/bin/env bash
echo "Installing Primeagen's core CLI tools..."
set -e

# Core terminal tools via Pacman
sudo pacman -S --needed --noconfirm \
    fzf \
    ripgrep \
    btop \
    just \
    tmux \
    zsh \
    go \
    git \
    wget \
    curl

# Install Go-based tools
echo "Installing Go tools (air, coll, sqlc, goose)"
go install github.com/air-verse/air@latest
go install github.com/ProCodeZero/project-collector/cmd/coll@latest
go install github.com/sqlc-dev/sqlc/cmd/sqlc@latest
go install github.com/pressly/goose/v3/cmd/goose@latest

echo "Configuring Go PATH for future terminal sessions..."

# Define the paths
# 1. The default directory where `go install` puts binaries (like sqlc, coll, air)
DEFAULT_GO_BIN="$HOME/go/bin"
# 2. The specific mise path you manually fixed
MISE_GO_BIN="$HOME/.local/share/mise/installs/go/1.26.4/bin"

# Check if it's already in .zshrc to avoid adding it multiple times if you re-run the script
if ! grep -q "go/bin" ~/.zshrc; then
    echo "" >> ~/.zshrc
    echo "# Go binaries (sqlc, coll, air, goose, etc.)" >> ~/.zshrc
    echo "export PATH=\"\$PATH:${DEFAULT_GO_BIN}:${MISE_GO_BIN}\"" >> ~/.zshrc
    echo "Added Go paths to ~/.zshrc"
else
    echo "ℹ️ Go paths already configured in ~/.zshrc"
fi
