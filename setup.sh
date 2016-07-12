#!/bin/bash

# Distro Detector
OS=$(lsb_release -si)

# Replace vim-tiny with vim-nox
apt-get remove -y vim-tiny
apt-get update

if [ "$OS" = "Ubuntu" ]; then
	apt-get install -y vim-nox-py2
elif [ "$OS" = "Debian" ]; then
	apt-get install -y vim-nox
else
	echo "Cannot detect OS"
	exit
fi

# Install NodeJS
curl -sL https://deb.nodesource.com/setup_4.x | sudo -E bash -
sudo apt-get install -y nodejs

# Update NPM
npm install npm -g

# Install YouCompleteMe Requirements
apt-get install -y build-essential cmake python-dev python3-dev

# Install pip & virtualenv
curl -O https://bootstrap.pypa.io/get-pip.py
python get-pip.py
pip install pip --upgrade
pip install virtualenv

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

exit
