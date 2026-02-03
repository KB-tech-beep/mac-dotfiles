# Shell Configuration Setup Guide

This guide provides instructions for linking macOS shell profiles (`.zshrc` and `.zprofile`) to repository files, making it easy to version control and update configurations across machines.

## Setup Steps

### ✅ Step 1 — Create `.zshrc` and `.zprofile` files

Create the shell configuration files in your home directory:

```bash
touch ~/.zshrc
touch ~/.zprofile
```

> **Note:** These files are created in your home directory (`~/`).

### ✅ Step 2 — Move existing configurations to the repository

Preserve your current shell configurations by moving them to the repository:

```bash
# Move the zshrc file
mv ~/.zshrc /path/to/repo/shell/.zshrc

# Verify the file was moved
ls /path/to/repo/shell/.zshrc
```

Replace `/path/to/repo` with the actual path to your mac-dotfiles repository.

### ✅ Step 3 — Create symbolic links

Create symlinks from your home directory to the repository files:

```bash
# Link .zshrc
ln -s /path/to/repo/shell/.zshrc ~/.zshrc

# Link .zprofile
ln -s /path/to/repo/shell/.zprofile ~/.zprofile
```

Verify the symlinks were created correctly:

```bash
ls -l ~/.zshrc
# Expected output: /Users/<username>/.zshrc -> /path/to/repo/shell/.zshrc

ls -l ~/.zprofile
# Expected output: /Users/<username>/.zprofile -> /path/to/repo/shell/.zprofile
```

### ✅ Step 4 — Reload your shell

Reload the shell configuration to apply changes:

```bash
source ~/.zshrc
source ~/.zprofile
```

Or restart your terminal to apply all changes.

## Terminal Configuration — Alacritty

### ✅ Step 1 — Install Alacritty

Install Alacritty, a GPU-accelerated terminal emulator:

```bash
brew install --cask alacritty
```

### ✅ Step 2 — Install Nerd Font

Install the MesloLGDZ Nerd Font for better symbol support:

```bash
brew install font-meslo-lg-nerd-font
```

### ✅ Step 3 — Create Alacritty configuration directory

Set up the configuration directory:

```bash
mkdir -p ~/.config/alacritty
```

### ✅ Step 4 — Create and configure alacritty.toml

Create the configuration file:

```bash
touch ~/.config/alacritty/alacritty.toml
```

Add the following configuration to `~/.config/alacritty/alacritty.toml`:

```toml
general.import = [
    "~/.config/alacritty/themes/themes/coolnight.toml"
]

[env]
# =============================================================================
# Alacritty Configuration
# =============================================================================

# ─────────────────────────────────────────────────────────────────────────
# Theme Import
# ─────────────────────────────────────────────────────────────────────────

general.import = [
    "~/.config/alacritty/themes/themes/coolnight.toml"
]

# ─────────────────────────────────────────────────────────────────────────
# Environment Variables
# ─────────────────────────────────────────────────────────────────────────

[env]
TERM = "xterm-256color"

# ─────────────────────────────────────────────────────────────────────────
# Window Configuration
# ─────────────────────────────────────────────────────────────────────────

[window]
padding.x = 10
padding.y = 10
decorations = "Buttonless"
opacity = 0.7
blur = true
option_as_alt = "Both"

# ─────────────────────────────────────────────────────────────────────────
# Font Configuration
# ─────────────────────────────────────────────────────────────────────────

[font]
normal.family = "MesloLGLDZ Nerd Font"
normal.style = "Italic"
size = 18

# ─────────────────────────────────────────────────────────────────────────
# Color Scheme
# ─────────────────────────────────────────────────────────────────────────

[colors.primary]
background = "#0a0e27"
foreground = "#e0e0e0"

[colors.normal]
black   = "#45475a"
red     = "#f38ba8"
green   = "#a6e3a1"
yellow  = "#f9e2af"
blue    = "#89b4fa"
magenta = "#f5c2e7"
cyan    = "#94e2d5"
white   = "#bac2de"

[colors.bright]
black   = "#585b70"
red     = "#f38ba8"
green   = "#a6e3a1"
yellow  = "#f9e2af"
blue    = "#89b4fa"
magenta = "#f5c2e7"
cyan    = "#94e2d5"
white   = "#a6adc8"

# =============================================================================
# End of Configuration
# =============================================================================
```

Restart Alacritty or reload your terminal to apply the configuration.

## Powerlevel10k Theme Configuration

### ✅ Step 1 — Install Powerlevel10k

Install the Powerlevel10k theme via Homebrew:

```bash
brew install powerlevel10k
```

### ✅ Step 2 — Add Powerlevel10k to .zshrc

Add the following line to your `~/.zshrc`:

```bash
echo "source $(brew --prefix)/share/powerlevel10k/powerlevel10k.zsh-theme" >> ~/.zshrc
```

### ✅ Step 3 — Configure the Theme

Run the Powerlevel10k configuration wizard:

```bash
p10k configure
```

Follow the interactive prompts to customize your prompt appearance. To reconfigure later, simply run `p10k configure` again.

### ✅ Step 4 — Clone Alacritty Theme Repository

Download the Alacritty theme repository:

```bash
cd ~/.config/alacritty
git clone https://github.com/alacritty/alacritty-theme themes
```

### ✅ Step 5 — Add Coolnight Theme

Download the Coolnight theme:

```bash
curl https://raw.githubusercontent.com/josean-dev/dev-environment-files/main/.config/alacritty/themes/themes/coolnight.toml \
  --output ~/.config/alacritty/themes/themes/coolnight.toml
```

The theme is automatically imported in your `alacritty.toml` configuration (see Alacritty setup above).

## ZSH History Configuration

The following history settings have been added to `.zshrc` to optimize command history:

```bash
# History file location
HISTFILE=$HOME/.zhistory
SAVEHIST=1000
HISTSIZE=999

# History options
setopt share_history              # Share history across all sessions
setopt hist_expire_dups_first     # Expire duplicate entries first
setopt hist_ignore_dups           # Don't save duplicate commands
setopt hist_verify                # Verify history expansion before execution
```

These settings ensure that your command history is shared across terminal sessions and duplicates are automatically cleaned up.

## Key Bindings Configuration

### ✅ Arrow Key History Search

Enable history search using arrow keys. Add the following to your `.zshrc`:

```bash
# History search with arrow keys
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward
```

This allows you to search through command history by typing a command prefix and pressing the up/down arrow keys.

## Additional Zsh Plugins

### ✅ Install Zsh Autosuggestions

Zsh-autosuggestions provides autocomplete suggestions based on your history:

```bash
brew install zsh-autosuggestions
```

Add the following to your `.zshrc`:

```bash
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
```

Reload your shell:

```bash
source ~/.zshrc
```

### ✅ Install Zsh Syntax Highlighting

Zsh-syntax-highlighting provides real-time syntax highlighting as you type:

```bash
brew install zsh-syntax-highlighting
```

Add the following to your `.zshrc`:

```bash
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
```

Reload your shell:

```bash
source ~/.zshrc
```

## Command Enhancements

### ✅ Install Eza (Enhanced ls)

Eza is a modern replacement for the `ls` command with better formatting and colors:

```bash
brew install eza
```

Add the following to your `.zshrc` to enhance the `ls` command with icons:

```bash
# Enhanced ls with eza
alias ls="eza --icons=always"
```

### ✅ Install Zoxide (Better cd)

Zoxide is a smarter `cd` command that learns your directory habits:

```bash
brew install zoxide
```

Add the following to your `.zshrc`:

```bash
# Initialize Zoxide
eval "$(zoxide init zsh)"

# Alias 'cd' to 'z' for consistency
alias cd="z"
```

# Optional: Alias 'cd' to 'z' for consistency
alias cd="z"
```

Reload your shell:

```bash
source ~/.zshrc
```

Zoxide will now track your directory navigation and allow faster jumps to frequently visited directories.
