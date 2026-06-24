# ThPrimeagen Dev Environment (Lite)

Welcome to my personal development bootstrap.
This is a ready-to-go, development environment that captures **80% of ThePrimeagen's legendary terminal workflow**, but makes it significantly easier to setup and more visually polished by leveraging **Omarchy** as the desktop foundation.

You get the raw, keyboard-driven speed of Tmux, Neovim, and Fzf, without sacrificing beautiful GUI menus, system OSDs, and effortless window management.

## My Setup vs. The "Pure" Primeagen Setup

| Feature | 🟢 My Setup (Omarchy + Primeagen CLI) | 🔴 Pure Primeagen Setup |
| :--- | :--- | :--- |
| **Base OS / WM** | **Omarchy** (Arch + Hyprland + beautiful defaults) | Raw Arch Linux + Raw Hyprland |
| **Desktop Utilities** | GUI Menus for WiFi/Bluetooth, SwayOSD for volume, `walker` app launcher, OCR, Dictation | Pure CLI/TUI. No GUI menus. |
| **Terminal Multiplexer**| **Tmux** (`Ctrl+b` prefix, `tmux-sessionizer`) | **Tmux** (`Ctrl+a` prefix, `tmux-sessionizer`) |
| **Editor** | **Neovim** (Kickstart/Primeagen config, LSP, Harpoon, Telescope) | **Neovim** (Exact same config) |
| **Shell** | **Zsh** + Oh-My-Zsh + Fzf + Autosuggestions | **Zsh** + Oh-My-Zsh + Fzf |
| **Bootstrapping** | Modular `./run` script (Pacman fixes, Omarchy bindings, CLI tools) | Modular `./run` script (Raw Arch install) |
| **Vibe** | "I want IDE-level speed, but I also want my volume slider to look nice." | "I want to configure everything from scratch using only a terminal." |

---

## Installation

This setup assumes you are starting from a fresh **Omarchy ISO** installation.

1. **Install Omarchy ISO** and boot into the desktop.
2. **Clone this repository:**
   ```bash
   git clone https://github.com/ProCodeZero/dev.git ~/dev
   cd ~/dev
   ```
3. **Run the bootstrap script:**
   ```bash
   chmod +x run
   ./run
   ```
   *This will automatically install CLI tools (fzf, ripgrep, btop, just, go, air), configure Zsh, set up Tmux with `tmux-sessionizer`, and pull the Neovim config.*
4. **Restart your terminal** (or run `source ~/.zshrc`) and you are ready to go!

## The Core Workflow

The philosophy here is simple: **Never touch the mouse when managing code or projects.**

1. **Launch the Terminal:** Use `SUPER + ALT + RETURN` (or your preferred Omarchy shortcut) to open tmux.
2. **Jump to a Project:** Press **`Ctrl + f`**. This triggers `tmux-sessionizer`, opening an Fzf menu of all your directories in `~/projects`, `~/work`, etc. Select a project, and it instantly creates (or switches to) a dedicated Tmux session for it.
3. **Live in Tmux:** You now have a dedicated workspace.
4. **Edit in Neovim:** Type `nvim` (or just `v`). You are now in a fully configured IDE. Use `Space + p + f` to find files, `Space + p + s` to grep your codebase, and `Alt + 1/2/3/4` to jump between your most-used files via Harpoon.
5. **Switch Contexts:** Need to check another project? Just press **`Ctrl + f`** again. Tmux handles the rest.

## The Ultimate Cheat Sheet

### Desktop & Window Management (Omarchy / Hyprland)
*These bindings are managed by Omarchy, with my custom overrides applied.*

| Action | Keybinding |
| :--- | :--- |
| **App Launcher** | `SUPER + SPACE` |
| **Terminal / Sessionizer** | `SUPER + ALT + RETURN` *(Custom)* |
| **Scratchpad (Quick Term)** | `SUPER + S` |
| **Focus Window** | `SUPER + H / J / K / L` *(Vim arrows!)* |
| **Switch Workspace** | `SUPER + [1-9]` |
| **Move Window to Workspace**| `SUPER + SHIFT + [1-9]` |
| **System Clipboard Manager** | `SUPER + CTRL + V` |
| **Screenshot** | `PRINT` |
| **OCR / Extract Text** | `SUPER + CTRL + PRINT` |
| **Hardware/WiFi/BT Menus** | `SUPER + CTRL + H / W / B` |

### Shell (Zsh + Fzf)
| Action | Keybinding |
| :--- | :--- |
| **Jump to Project (Sessionizer)**| `Ctrl + f` |
| **Search Command History** | `Ctrl + r` |
| **Fuzzy Find Files** | `Ctrl + t` |
| **Fuzzy Find & `cd` into Dir** | `Alt + c` |
| **Accept Autosuggestion** | `Ctrl + k` *(or Right Arrow)* |

### Tmux (Prefix is `Ctrl + b`)
| Action | Keybinding |
| :--- | :--- |
| **Prefix Key** | `Ctrl + b` |
| **Jump to Project (Sessionizer)**| `Ctrl + f` *(Works outside tmux too!)* |
| **Split Vertical (Left/Right)** | `Prefix` then `|` |
| **Split Horizontal (Top/Bottom)**| `Prefix` then `-` |
| **Zoom Current Pane** | `Prefix` then `z` |
| **Create New Window** | `Prefix` then `c` |
| **Reload Tmux Config** | `Prefix` then `r` |

### Neovim (Leader is `Space`)
| Action | Keybinding |
| :--- | :--- |
| **Find Files (Telescope)** | `Space` then `p` then `f` |
| **Grep Search (Ripgrep)** | `Space` then `p` then `s` |
| **Git-tracked Files** | `Ctrl + p` |
| **Harpoon Quick Menu** | `Ctrl + e` |
| **Add File to Harpoon** | `Space` then `a` |
| **Jump to Harpoon 1-4** | `Alt + 1 / 2 / 3 / 4` |
| **Go to Definition** | `g d` |
| **Code Actions / Refactor** | `Space` then `v c a` |
| **Rename Symbol** | `Space` then `v r n` |
| **Format Code** | `Space` then `f` |
| **Git Status (Fugitive)** | `Space` then `g s` |
| **Zen Mode (Distraction-free)**| `Space` then `z z` |
| **Run Nearest Test** | `Space` then `t r` |
| **Toggle Debug Breakpoint** | `Space` then `b` |

---

### Another info

1. **The "Greatest Remap":** In visual mode, `p` pastes without overwriting your clipboard. In normal mode, `d` deletes to the black hole register so you don't accidentally overwrite your yanked text. Use `y` to yank to the system clipboard.
2. **Harpoon is King:** Don't use Telescope for files you open every 5 minutes. Add them to Harpoon (`Space + a`) and use `Alt + 1/2/3/4` to instantly teleport between them.
3. **Embrace the Friction:** The first 3 days will feel slow. Your muscle memory will fight you. Push through it. By day 7, you won't be able to use a normal IDE again.
```
