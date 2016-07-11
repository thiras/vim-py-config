#!/bin/bash
mkdir -p ~/.vim/bundle
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Move dot files
cp .vimrc ~

# Vim PluginInstall
vim +PluginInstall +qall

echo "Setup Complete"
