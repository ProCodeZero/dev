#!/usr/bin/env bash
set -euo pipefail

MIRRORLIST="/etc/pacman.d/mirrorlist"
RACKSPACE_LINE="Server = https://mirror.rackspace.com/archlinux/\$repo/os/\$arch"

# Replace mirrorlist with single Rackspace mirror
echo "$RACKSPACE_LINE" | sudo tee "$MIRRORLIST" > /dev/null

# Remove local package DB files
sudo rm -f "${PACMAN_SYNC_DIR}"/*.db*

# Force refresh package databases
sudo pacman -Syy

