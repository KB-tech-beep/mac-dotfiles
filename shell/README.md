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