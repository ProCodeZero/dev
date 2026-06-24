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

# fzf install
source <(fzf --zsh)

# Set fzf default options for better UX
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'

# Go binaries (sqlc, coll, air, goose, etc.)
export PATH="$PATH:/home/hl/go/bin:/home/hl/.local/share/mise/installs/go/1.26.4/bin"

# ThePrimeagen's tmux-sessionizer (Ctrl+f) — works outside tmux too
bindkey -s '^f' '\n~/.local/bin/tmux-sessionizer\n'

# --- fzf universal keybindings and completion ---
source <(fzf --zsh)
