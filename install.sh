#!/usr/bin/env bash

set -e # exit on error
DOTFILES_DIR="$HOME/dotfiles"
ZSH_CUSTOM="$HOME/.oh-my-zsh/custom"

echo "Starting dotfiles installation..."

# 2️⃣ Install Oh My Zsh if not already installed
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "Installing Oh My Zsh..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
else
  echo "Oh My Zsh already installed."
fi

# 3️⃣ Clone dotfiles repo if not exists
if [ ! -d "$DOTFILES_DIR" ]; then
  echo "Cloning dotfiles repo..."
  git clone https://github.com/sadid56/dotfiles.git "$DOTFILES_DIR"
else
  echo "Dotfiles repo already exists. Pulling latest changes..."
  git -C "$DOTFILES_DIR" pull
fi

# 4️⃣ Backup existing configs
backup() {
  for file in "$@"; do
    if [ -e "$file" ]; then
      echo "Backing up $file to $file.backup"
      mv "$file" "$file.backup"
    fi
  done
}

backup ~/.zshrc ~/.config/nvim ~/.config/kitty ~/.config/fastfetch

# 5️⃣ Symlink configs
echo "Creating symlinks..."
ln -sf "$DOTFILES_DIR/.zshrc" ~/.zshrc
mkdir -p ~/.config
ln -sf "$DOTFILES_DIR/nvim" ~/.config/nvim
ln -sf "$DOTFILES_DIR/kitty" ~/.config/kitty
ln -sf "$DOTFILES_DIR/fastfetch" ~/.config/fastfetch

# 6️⃣ Install Zsh plugins
mkdir -p $ZSH_CUSTOM/plugins

# zsh-autosuggestions
if [ ! -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ]; then
  echo "Installing zsh-autosuggestions..."
  git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
fi

# zsh-syntax-highlighting
if [ ! -d "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" ]; then
  echo "Installing zsh-syntax-highlighting..."
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
fi

# powerlevel10k theme
if [ ! -d "$ZSH_CUSTOM/themes/powerlevel10k" ]; then
  echo "Installing powerlevel10k theme..."
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
fi

# 7️⃣ Set zsh as default shell
if [ "$SHELL" != "$(which zsh)" ]; then
  echo "Setting zsh as default shell..."
  chsh -s $(which zsh)
fi

echo "Dotfiles installation complete! 🎉"
echo "Please restart your terminal to apply Zsh configuration."
