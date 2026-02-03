#!/usr/bin/env zsh
# =============================================================================
# Zsh Configuration File
# =============================================================================

# ─────────────────────────────────────────────────────────────────────────
# Powerlevel10k Theme Configuration
# ─────────────────────────────────────────────────────────────────────────

# Enable Powerlevel10k instant prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Source Powerlevel10k theme
source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme

# Load Powerlevel10k configuration
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


# ─────────────────────────────────────────────────────────────────────────
# Shell History Configuration
# ─────────────────────────────────────────────────────────────────────────

HISTFILE=$HOME/.zhistory
SAVEHIST=1000
HISTSIZE=999

setopt share_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify

# ─────────────────────────────────────────────────────────────────────────
# Key Bindings
# ─────────────────────────────────────────────────────────────────────────

# History search with arrow keys
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward

# ─────────────────────────────────────────────────────────────────────────
# Aliases
# ─────────────────────────────────────────────────────────────────────────

# Utility shortcuts
alias cl="clear"
alias test='echo "Test Successful"'

# Enhanced ls with eza
alias ls="eza --icons=always"

# ─────────────────────────────────────────────────────────────────────────
# Zsh Plugins
# ─────────────────────────────────────────────────────────────────────────

# Autosuggestions plugin
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Syntax highlighting plugin
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# ─────────────────────────────────────────────────────────────────────────
# Command Enhancements
# ─────────────────────────────────────────────────────────────────────────

# Zoxide initialization (smarter cd)
eval "$(zoxide init zsh)"

# Alias 'cd' to 'z' for consistency
alias cd="z"

# ─────────────────────────────────────────────────────────────────────────
# End of Configuration
# ─────────────────────────────────────────────────────────────────────────