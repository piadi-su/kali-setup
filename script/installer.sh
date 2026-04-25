#!/bin/bash

#update
sudo apt update && sudo apt upgrade -y

#install pkg's
sudo apt install git tmux neovim kitty i3 i3blocks zoxide kitty rofi terminator fastfetch dunst nautilus -y

#cloning the repo
https://github.com/piadi-su/kali-setup.git


#oh my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions

git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k

#nvim config
https://github.com/piadi-su/my_nvim.git $HOME/.config/nvim

#
cd kali-setup/dotfiles

mv i3  $HOME/.config
mv i3blocks  $HOME/.config
mv kitty $HOME/.config
mv rofi $HOME/.config
mv .tmux.conf $HOME
mv .zshrc $HOME

mv wallpaper $HOME

cd $HOME

#autotiling
git clone https://github.com/piadi-sudo/i3-autotiling-in-c.git
cd i3-autotiling-in-c
make
mv autotiling ~/.local/bin/


