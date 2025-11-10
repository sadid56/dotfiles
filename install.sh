#!/usr/bin/env bash

set -e  # exit on error
DOTFILES_DIR="$HOME/dotfiles"

echo "Starting dotfiles installation..."


# 2️⃣ Clone dotfiles repo if not exists
if [ ! -d "$DOTFILES_DIR" ]; then
    echo "Cloning dotfiles repo..."
    git clone https://github.com/sadid56/dotfiles.git "$DOTFILES_DIR"
else
    echo "Dotfiles repo already exists. Pulling latest changes..."
    git -C "$DOTFILES_DIR" pull
fi

# 3️⃣ Backup existing configs
backup() {
    for file in "$@"; do
        if [ -e "$file" ]; then
            echo "Backing up $file to $file.backup"
            mv "$file" "$file.backup"
        fi
    done
}

backup ~/.zshrc ~/.config/nvim ~/.config/kitty ~/.config/fastfetch

# 4️⃣ Symlink configs
echo "Creating symlinks..."
ln -sf "$DOTFILES_DIR/.zshrc" ~/.zshrc
mkdir -p ~/.config
ln -sf "$DOTFILES_DIR/nvim" ~/.config/nvim
ln -sf "$DOTFILES_DIR/kitty" ~/.config/kitty
ln -sf "$DOTFILES_DIR/fastfetch" ~/.config/fastfetch

# 5️⃣ Set zsh as default shell
if [ "$SHELL" != "/usr/bin/zsh" ]; then
    echo "Setting zsh as default shell..."
    chsh -s $(which zsh)
fi

echo "Dotfiles installation complete! 🎉"
echo "Please restart your terminal."
