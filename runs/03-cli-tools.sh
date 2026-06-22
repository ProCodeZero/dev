#!/usr/bin/env bash
echo "Installing Primeagen's core CLI tools..."

# Core terminal tools via Pacman
sudo pacman -S --needed --noconfirm \
    fzf \
    ripgrep \
    btop \
    just \
    tmux \
    zsh \
    zsh-autosuggestions \
    zsh-syntax-highlighting \
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

# Ensure Go bin is in PATH (add to .zshrc later)
if ! grep -q "GOPATH" ~/.zshrc 2>/dev/null; then
    echo 'export GOPATH=$HOME/go' >> ~/.zshrc
    echo 'export PATH=$PATH:$GOPATH/bin' >> ~/.zshrc
fi
