# ⚡ Linux Dotfiles

> Modern productive Linux setup. Includes Zsh, Neovim, Kitty, Fastfetch, and fully automated plugin installation.

[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)
[![Shell: Zsh](https://img.shields.io/badge/Shell-Zsh-blue.svg)](https://www.zsh.org/)
[![Neovim](https://img.shields.io/badge/Editor-Neovim-57a143.svg)](https://neovim.io/)
[![Kitty](https://img.shields.io/badge/Terminal-Kitty-ff79c6.svg)](https://sw.kovidgoyal.net/kitty/)

---

## 📝 About

This repository contains my **personal dotfiles** for Fedora and Unix-like systems. It is designed for:

- Clean, modern terminal setup
- Productivity-focused Neovim configuration
- Fast and informative system status with Fastfetch
- Fully automated Zsh setup with plugins and Powerlevel10k theme

---

## ⚠️ Before You Start

**Important:** The installer backs up existing configuration files:

```bash
~/.zshrc -> ~/.zshrc.backup
~/.config/nvim -> ~/.config/nvim.backup
~/.config/kitty -> ~/.config/kitty.backup
~/.config/fastfetch -> ~/.config/fastfetch.backup
```

Make sure you don’t have unsaved changes in your configs before running the installer.

🛠️ Dependencies

Fedora:
```bash
sudo dnf install -y zsh neovim kitty git curl wget fontconfig powerline fonts-powerline
```

Arch:
```bash
sudo pacman -S zsh neovim kitty git curl wget fontconfig powerline fonts-powerline 
```

Other distros: Use your package manager (apt, zyper, etc.) to install these packages.

🚀 Installation
Step 1: Clone and Install

```bash
git clone https://github.com/sadid56/dotfiles.git ~/dotfiles
cd ~/dotfiles
./install.sh
```

This script will:

- Backup existing configs
- Symlink dotfiles to the correct locations
- Install Zsh plugins automatically:
- zsh-autosuggestions
- zsh-syntax-highlighting
- powerlevel10k theme
- Set Zsh as the default shell

Step 2: Restart Terminal
After installation, restart your terminal for Zsh and the theme to load correctly.

🎨 Optional: Powerlevel10k Configuration

When you first start Zsh after installation, Powerlevel10k will guide you through a setup wizard for a personalized prompt.

# Thanks For Explore Me 😍
