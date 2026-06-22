#!/usr/bin/env bash
set -e

echo "Setting up Tmux and tmux-sessionizer..."

# 1. Install Tmux Plugin Manager (TPM)
if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
    git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
fi

# Create dirs only if they don't exist (or use -p which is also safe)
for d in "$HOME/work" "$HOME/work/builds" "$HOME/projects" "$HOME/personal"; do
    if [ ! -d "$d" ]; then
        mkdir -p "$d"
    fi
done

# 2. Create tmux-sessionizer script (ThePrimeagen's exact version)
mkdir -p "$HOME/.local/bin"
cat > "$HOME/.local/bin/tmux-sessionizer" << 'EOF'
#!/usr/bin/env bash

if [[ $# -eq 1 ]]; then
    selected=$1
else
    selected=$(find ~/work/builds ~/projects ~/work ~/personal -mindepth 1 -maxdepth 1 -type d | fzf)
fi

if [[ -z $selected ]]; then
    exit 0
fi

selected_name=$(basename "$selected" | tr . _)
tmux_running=$(pgrep tmux)

if [[ -z $TMUX ]] && [[ -z $tmux_running ]]; then
    tmux new-session -s $selected_name -c $selected
    exit 0
fi

if ! tmux has-session -t=$selected_name 2> /dev/null; then
    tmux new-session -ds $selected_name -c $selected
fi

tmux switch-client -t $selected_name
EOF
chmod +x "$HOME/.local/bin/tmux-sessionizer"

# 3. Symlink the .tmux.conf
ln -sf "$(pwd)/configs/.tmux.conf" "$HOME/.tmux.conf"

# 4. Install tmux plugins
if [ -d "$HOME/.tmux/plugins/tpm" ]; then
    "$HOME/.tmux/plugins/tpm/bin/install_plugins" || true
fi

