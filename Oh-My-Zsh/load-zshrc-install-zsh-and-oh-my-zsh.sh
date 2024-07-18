#!/bin/bash


# Install zsh
sudo apt install zsh


# Install Oh-My-Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"


# Set zsh as default shell
sudo chsh -s $(which zsh)


# Add .zshrc settings
sudo rm -rf ~/.zshrc && sudo cp .zshrc ~

