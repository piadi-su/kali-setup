#!/bin/bash
set -euo pipefail

echo "Updating system..."
sudo apt update && sudo apt upgrade -y

echo "Installing packages..."
sudo apt install -y \
  git tmux neovim kitty i3 i3blocks zoxide rofi terminator \
  fastfetch dunst nautilus build-essential curl unzip

echo "Cloning dotfiles repo..."
git clone https://github.com/piadi-su/kali-setup.git

echo "Installing Oh My Zsh..."
RUNZSH=no CHSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# ZSH CUSTOM PATH
ZSH_CUSTOM=${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}

echo "Installing Zsh plugins..."
git clone https://github.com/zsh-users/zsh-autosuggestions.git \
  "$ZSH_CUSTOM/plugins/zsh-autosuggestions"

git clone https://github.com/romkatv/powerlevel10k.git \
  "$ZSH_CUSTOM/themes/powerlevel10k"

echo "Installing Neovim config..."
git clone https://github.com/piadi-su/my_nvim.git "$HOME/.config/nvim"

echo "Applying dotfiles..."

cd "$HOME/kali-setup/dotfiles"

# directories
mkdir -p "$HOME/.config"
mkdir -p "$HOME/.local/bin"

# configs
cp -r i3 "$HOME/.config/"
cp -r i3blocks "$HOME/.config/"
cp -r kitty "$HOME/.config/"
cp -r rofi "$HOME/.config/"

cp .tmux.conf "$HOME/"
cp .zshrc "$HOME/"

cp -r wallpaper "$HOME/"

echo "Installing autotiling..."

git clone https://github.com/piadi-sudo/i3-autotiling-in-c.git
cd i3-autotiling-in-c
make

mv autotiling "$HOME/.local/bin/"

echo "Setup completed!"
