# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Theme
ZSH_THEME="robbyrussell"

# Plugins (removed invalid 'fzf' plugin)
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
alias btop="btop"

# --- fzf keybindings (Arch installs to /usr/share/fzf/) ---
[ -f /usr/share/fzf/keybindings.zsh ] && source /usr/share/fzf/keybindings.zsh
[ -f /usr/share/fzf/completion.zsh ]   && source /usr/share/fzf/completion.zsh
# Fallback if you run fzf's install script instead:
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Go binaries (sqlc, coll, air, goose, etc.)
export PATH="$PATH:/home/hl/go/bin:/home/hl/.local/share/mise/installs/go/1.26.4/bin"
