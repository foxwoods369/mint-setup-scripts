#!/bin/bash

cp -r .[!.]* ~

if [ -f ~/.bashrc_orig ]; then
    cp ~/.bashrc_orig ~/.bashrc
fi

cp ~/.bashrc ~/.bashrc_orig
cat <<EOF >> ~/.bashrc
if [ -f ~/.colors ]; then
	. ~/.colors
fi
EOF

if [ -f ~/.profile_orig ]; then
    cp ~/.profile_orig ~/.profile
fi

cp ~/.profile ~/.profile_orig 
cat <<EOF >> ~/.profile
export PYENV_ROOT="\$HOME/.pyenv"
export NPM_CONFIG_PREFIX="\$HOME/.npm-global"
export PATH="\$HOME/bin:\$NPM_CONFIG_PREFIX/bin:\$PYENV_ROOT/bin:\$PATH"
eval "\$(pyenv init -)"
eval "\$(pyenv virtualenv-init -)"
EOF
