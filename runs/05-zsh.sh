#!/usr/bin/env bash
set -e
echo "Setting up Zsh and Oh-My-Zsh..."

# 1. Install Oh-My-Zsh if not present
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "Installing Oh-My-Zsh..."
  # --unattended prevents it from launching a new zsh shell automatically
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

# 2. Define custom plugins directory
ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"

# 3. Clone zsh-autosuggestions if not already present
if [ ! -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ]; then
  echo "Installing zsh-autosuggestions plugin..."
  git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
fi

# 4. Clone zsh-syntax-highlighting if not already present
if [ ! -d "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" ]; then
  echo "Installing zsh-syntax-highlighting plugin..."
  git clone https://github.com/zsh-users/zsh-syntax-highlighting "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"
fi

# 5. Symlink .zshrc
ln -sf "$(pwd)/configs/.zshrc" ~/.zshrc

# 6. Change default shell to zsh
if [ "$SHELL" != "$(which zsh)" ]; then
  echo "Changing default shell to zsh..."
  chsh -s "$(which zsh)"
fi

# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)

echo "Zsh setup complete."
