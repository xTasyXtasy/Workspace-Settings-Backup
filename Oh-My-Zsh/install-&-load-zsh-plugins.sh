#!/bin/bash


# Install Spaceship-Prompt
mkdir -p "$HOME/.zsh"
git clone --depth=1 https://github.com/spaceship-prompt/spaceship-prompt.git "$HOME/.zsh/spaceship"


# Install Auto-Suggestions
sudo apt install zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions


# Install Syntax-Highlighting & One-Dark-Theme
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/REALERvolker1/onedark-pro-zsh-syntax-highlighter.git && mv onedark-pro-zsh-syntax-highlighter ~
