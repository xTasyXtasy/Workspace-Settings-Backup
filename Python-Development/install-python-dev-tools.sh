#!/bin/bash


# Pipx
sudo apt install pipx


# Poetry
pipx install poetry
pipx ensurepath


# Ignr
pipx install ignr
pipx ensurepath


# HTTPie
pipx install httpie
pipx ensurepath


# Pyenv

# Some dependencies
sudo apt install -y
	make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev \
    libsqlite3-dev wget llvm libncursesw5-dev xz-utils tk-dev libxml2-dev \
	libxmlsec1-dev libffi-dev liblzma-dev

alias brew='env PATH="${PATH//$(pyenv root)\/shims:/}" brew'
curl https://pyenv.run | bash
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zshrc
echo '[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zshrc
echo 'eval "$(pyenv init -)"' >> ~/.zshrc
