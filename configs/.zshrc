# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Theme
ZSH_THEME="robbyrussell"

# Plugins
plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
  z
)

source $ZSH/oh-my-zsh.sh

# --- Go environment ---
export GOPATH=$HOME/go
export PATH="$HOME/.local/bin:$GOPATH/bin:$PATH"

# --- Aliases ---
alias vim="nvim"
alias v="nvim"
alias conf="nvim ~/.config/nvim"

# --- fzf integration (Arch Linux specific) ---
# Try multiple possible locations for fzf files
if [ -f /usr/share/fzf/keybindings.zsh ]; then
  source /usr/share/fzf/keybindings.zsh
  source /usr/share/fzf/completion.zsh
elif [ -f /usr/share/doc/fzf/examples/key-bindings.zsh ]; then
  source /usr/share/doc/fzf/examples/key-bindings.zsh
  source /usr/share/doc/fzf/examples/completion.zsh
elif command -v fzf-share >/dev/null 2>&1; then
  # fzf-share is a helper that prints the share directory
  source "$(fzf-share)/key-bindings.zsh"
  source "$(fzf-share)/completion.zsh"
fi

# Set fzf default options for better UX
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'

# Go binaries (sqlc, coll, air, goose, etc.)
export PATH="$PATH:/home/hl/go/bin:/home/hl/.local/share/mise/installs/go/1.26.4/bin"
