#!/bin/bash

if [ "$1" == "backup" ]; then
	cp ~/.bashrc ~/.bashrc_orig
	cp ~/.profile ~/.profile_orig
fi

cp -r .[^.]* ~

cp ~/.bashrc_orig ~/.bashrc
cp ~/.profile_orig ~/.profile
cat <<EOF >> ~/.bashrc
if [ -f ~/.colors ]; then
	. ~/.colors
fi
EOF

cat <<EOF >> ~/.profile
export PYENV_ROOT="\$HOME/.pyenv"
export NPM_CONFIG_PREFIX="\$HOME/.npm-global"
export PATH="\$HOME/bin:\$NPM_CONFIG_PREFIX/bin:\$PYENV_ROOT/bin:\$PATH"
eval "\$(pyenv init -)"
EOF
