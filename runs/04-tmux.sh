#!/usr/bin/env bash
echo "Setting up Tmux and tmux-sessionizer..."

# 1. Install Tmux Plugin Manager (TPM)
if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

# 2. Clone his tmux-sessionizer tool
if [ ! -d "$HOME/.local/src/tmux-sessionizer" ]; then
    mkdir -p ~/.local/src
    git clone https://github.com/ThePrimeagen/tmux-sessionizer.git ~/.local/src/tmux-sessionizer
    # Symlink the script to a location in your PATH
    mkdir -p ~/.local/bin
    ln -sf ~/.local/src/tmux-sessionizer/tmux-sessionizer.sh ~/.local/bin/tmux-sessionizer
    chmod +x ~/.local/bin/tmux-sessionizer
fi

# 3. Symlink the .tmux.conf
ln -sf $(pwd)/configs/.tmux.conf ~/.tmux.conf

# 4. Install tmux plugins (runs in background)
~/.tmux/plugins/tpm/bin/install_plugins || true
