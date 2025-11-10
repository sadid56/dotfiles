# ⚡ Fedora/Unix Dotfiles

> My personal dotfiles for a modern, productive Linux setup. Includes Zsh, Neovim, Kitty, Fastfetch, and fully automated plugin installation.

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

🛠️ Dependencies

Fedora:
sudo dnf install -y zsh neovim kitty git curl wget fontconfig powerline fonts-powerline

Arch:
sudo pacman -Y zsh neovim kitty git curl wget fontconfig powerline fonts-powerline

🚀 Installation
Step 1: Clone and Install

git clone https://github.com/sadid56/dotfiles.git ~/dotfiles
cd ~/dotfiles
./install.sh

This script will:

- Install dependencies (if missing)
- Backup existing configs
- Symlink dotfiles to the correct locations
- Install Zsh plugins automatically:
- zsh-autosuggestions
- zsh-syntax-highlighting
- powerlevel10k theme
- Set Zsh as the default shell


Step 2: Restart Terminal

After installation, restart your terminal for Zsh and the theme to load correctly.
