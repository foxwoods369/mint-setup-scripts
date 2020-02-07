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

export PYENV_ROOT="\$HOME/.pyenv"
export NPM_CONFIG_PREFIX="\$HOME/.npm-global"
export PATH="\$NPM_CONFIG_PREFIX/bin:\$PYENV_ROOT/bin:\$PATH"
eval "\$(pyenv init -)"
eval "\$(pyenv virtualenv-init -)"
eval "\$(direnv hook bash)"
EOF
