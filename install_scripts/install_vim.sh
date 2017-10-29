#!/bin/bash
# clone vim repository
git clone https://github.com/foxwoods369/vim-mods.git ~/.vim

# install vim from scratch
~/.vim/install_vim_debian.sh

# install powerline
pip install powerline-status
wget https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf\
https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf
sudo mv PowerlineSymbols.otf /usr/share/fonts/
sudo mv 10-powerline-symbols.conf /etc/fonts/conf.d/
sudo cp "DejaVu Sans Mono for Powerline.ttf" /usr/share/fonts/
sudo fc-fache -vf

# install markdown preview
npm -g install instant-markdown-d

# PluginInstall
vim -c 'PluginInstall' -c 'qa!'
