#!/bin/bash

# Replace vim-tiny with vim-nox
apt-get remove vim-tiny
apt-get update
apt-get install vim-nox

# Install YouCompleteMe Requirements
apt-get install build-essential cmake python-dev python3-dev

mkdir -p ~/.vim/bundle
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Move dot files
cp .vimrc ~

# Vim PluginInstall
vim +PluginInstall +qall

# YouCompleteMe Compiling
cd ~/.vim/bundle/YouCompleteMe
./install.py --tern-completer

echo "Setup Complete"
