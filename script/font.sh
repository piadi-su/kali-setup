#!/bin/bash

#jetbrains mono
mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts

curl -fLO https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip

unzip JetBrainsMono.zip
rm JetBrainsMono.zip


#comic mono
mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts

curl -fLO https://dtinth.github.io/comic-mono-font/ComicMono.ttf
curl -fLO https://dtinth.github.io/comic-mono-font/ComicMono-Bold.ttf


fc-cache -fv
