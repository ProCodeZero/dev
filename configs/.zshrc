# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Theme (Primeagen often uses simple themes or powerlevel10k, but 'robbyrussell' or 'dst' is fine)
ZSH_THEME="dst"

# Plugins
plugins=(
  git
  fzf
  zsh-autosuggestions
  zsh-syntax-highlighting
  z
)

source $ZSH/oh-my-zsh.sh

# Aliases
alias vim="nvim"
alias v="nvim"
alias conf="nvim ~/.config/nvim"
# Where the local dev should be placed?
# alias dots="cd ~/.local/src/dots" # Or wherever your dev repo is
alias btop="btop"

# Ensure local bin is in PATH (for tmux-sessionizer)
export PATH="$HOME/.local/bin:$PATH"

# Initialize fzf keybindings (Ctrl-R for history, Ctrl-T for files)
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
