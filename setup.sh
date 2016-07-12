#!/bin/bash

# Distro Detector
OS=$(lsb_release -si)

# Replace vim-tiny with vim-nox
apt-get remove vim-tiny
apt-get update

if [ $OS = "Debian" ]; then
	apt-get install vim-nox
else if [ $OS = "Ubuntu" ]; then
	apt-get install vim-nox-py2
else
	echo "Cannot detect OS"
	break
fi

# Install NodeJS
curl -sL https://deb.nodesource.com/setup_4.x | sudo -E bash -
sudo apt-get install -y nodejs

# Update NPM
npm install npm -g

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
