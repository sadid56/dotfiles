#!/usr/bin/env bash

# Exit on error
set -e

# Check if the active/parent shell is Zsh
PARENT_SHELL=$(ps -o comm= -p $PPID 2>/dev/null || echo "")
if [[ "$PARENT_SHELL" == *"zsh"* ]] || [ -n "$ZSH_VERSION" ]; then
  echo "⚠️ Warning: You are running this script from a Zsh session."
  echo "Since this script uninstalls your Zsh and Oh My Zsh configurations,"
  echo "it is highly recommended to switch your active session to Bash first."
  echo
  echo "To switch to Bash, please run:"
  echo "  exec bash"
  echo
  read -p "Would you like to exit now to switch to Bash? [Y/n]: " exit_for_bash
  if [[ ! "$exit_for_bash" =~ ^[Nn]$ ]]; then
    echo "Exiting. Please run 'exec bash' and then rerun the uninstaller."
    exit 0
  fi
  echo
fi

# Define variables
DOTFILES_DIR="$HOME/dotfiles"
ZSH_CUSTOM="$HOME/.oh-my-zsh/custom"

echo "============================================="
echo "  Dotfiles Configuration Uninstaller 🧹"
echo "============================================="
echo

# Helper function to safely restore backups or clean up symlinks
restore_backup() {
  local target="$1"
  local backup="${target}.backup"

  if [ -L "$target" ]; then
    echo "-> Removing symlink: $target"
    rm "$target"
  elif [ -e "$target" ]; then
    echo "-> [Warning] $target exists but is not a symlink. Keeping as-is."
  fi

  if [ -e "$backup" ]; then
    echo "-> Restoring backup: $backup -> $target"
    mv "$backup" "$target"
  else
    echo "-> No backup found for $target"
  fi
}

# 1. Restore configuration backups and remove symlinks
echo "1️⃣ Restoring original configuration files..."
restore_backup "$HOME/.zshrc"
restore_backup "$HOME/.config/nvim"
restore_backup "$HOME/.config/kitty"
restore_backup "$HOME/.config/fastfetch"
echo "Original configs restored successfully."
echo

# 2. Remove Oh My Zsh plugins and theme installed by install.sh, and P10k configuration/cache
echo "2️⃣ Cleaning up Zsh custom plugins, theme, and Powerlevel10k files..."
PLUGINS_TO_REMOVE=(
  "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
  "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"
  "$ZSH_CUSTOM/themes/powerlevel10k"
)

for path in "${PLUGINS_TO_REMOVE[@]}"; do
  if [ -d "$path" ]; then
    echo "-> Removing: $path"
    rm -rf "$path"
  else
    echo "-> Already removed or not found: $path"
  fi
done

# Clean up Powerlevel10k configuration and cache files
if [ -f "$HOME/.p10k.zsh" ]; then
  echo "-> Removing Powerlevel10k configuration file: $HOME/.p10k.zsh"
  rm -f "$HOME/.p10k.zsh"
fi

if ls "$HOME/.cache"/p10k* >/dev/null 2>&1; then
  echo "-> Removing Powerlevel10k cache files..."
  rm -rf "$HOME/.cache"/p10k*
fi

echo "Custom plugins/theme and Powerlevel10k configuration cleaned up."
echo

# 3. Ask to completely remove Oh My Zsh if it exists
if [ -d "$HOME/.oh-my-zsh" ]; then
  read -p "❓ Would you like to completely remove Oh My Zsh? [y/N]: " rm_omz
  if [[ "$rm_omz" =~ ^[Yy]$ ]]; then
    if [ -f "$HOME/.oh-my-zsh/tools/uninstall.sh" ]; then
      echo "Running Oh My Zsh uninstaller..."
      sh "$HOME/.oh-my-zsh/tools/uninstall.sh"
    else
      echo "Removing ~/.oh-my-zsh..."
      rm -rf "$HOME/.oh-my-zsh"
    fi
    # Clean up any residual zsh cache/compdump files
    rm -f "$HOME"/.zcompdump*
  fi
  echo
fi

# 4. Ask to revert default shell to bash
CURRENT_SHELL="$(getent passwd "$USER" | cut -d: -f7)"
if [[ "$CURRENT_SHELL" == *"zsh"* ]]; then
  read -p "❓ Your default shell is currently set to Zsh. Revert to Bash? [y/N]: " revert_shell
  if [[ "$revert_shell" =~ ^[Yy]$ ]]; then
    BASH_PATH="/bin/bash"
    if [ -f "/usr/bin/bash" ]; then
      BASH_PATH="/usr/bin/bash"
    fi
    echo "Reverting default shell to $BASH_PATH..."
    chsh -s "$BASH_PATH"
  fi
  echo
fi

# 5. Ask to delete the cloned dotfiles directory
REAL_DOTFILES_DIR="$(cd "$DOTFILES_DIR" 2>/dev/null && pwd || true)"
CURRENT_DIR="$(pwd)"

if [ -d "$DOTFILES_DIR" ]; then
  read -p "❓ Would you like to delete the cloned dotfiles repository at $DOTFILES_DIR? [y/N]: " rm_repo
  if [[ "$rm_repo" =~ ^[Yy]$ ]]; then
    if [ "$CURRENT_DIR" = "$REAL_DOTFILES_DIR" ]; then
      echo "⚠️ You are currently running the uninstall script from inside $DOTFILES_DIR."
      echo "We cannot delete it automatically while running. Please run this command after the script finishes:"
      echo "  rm -rf $DOTFILES_DIR"
    else
      echo "Removing $DOTFILES_DIR..."
      rm -rf "$DOTFILES_DIR"
    fi
  fi
  echo
fi

echo "============================================="
echo "  Dotfiles uninstallation complete! 🎉"
echo "  Please restart your terminal session."
echo "============================================="
