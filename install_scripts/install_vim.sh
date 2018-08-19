#!/bin/bash
# clone vim repository
git clone https://github.com/foxwoods369/vim-mods.git ~/.vim

cd ~/.vim
# install vim from scratch
PKG_OK=$(dpkg-query -W --showformat='${Status}\n' vim | grep "install ok installed")
if  [ "" == "$PKG_OK" ]; then
	./install_vim_debian.sh
fi

# install powerline
pip install powerline-status
wget https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf \
https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf
sudo mv PowerlineSymbols.otf /usr/share/fonts/
sudo mv 10-powerline-symbols.conf /etc/fonts/conf.d/
sudo cp "DejaVu Sans Mono for Powerline.ttf" /usr/share/fonts/
sudo fc-fache -vf

# install markdown preview
npm -g install instant-markdown-d

# PluginInstall
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim -c 'PluginInstall' -c 'qa!'
