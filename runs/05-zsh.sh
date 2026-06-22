#!/usr/bin/env bash
echo "Setting up Zsh and Oh-My-Zsh..."

# Install Oh-My-Zsh if not present
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)" "" --unattended
fi

# Symlink .zshrc
ln -sf $(pwd)/configs/.zshrc ~/.zshrc

# Change default shell to zsh
if [ "$SHELL" != "$(which zsh)" ]; then
    chsh -s $(which zsh)
fi
