#!/bin/bash

cp -r * ~

cat <<EOF >> ~/.bashrc
if [ -f ~/.colors ]; then
	. ~/.colors
fi
EOF

cat <<EOF >> ~/.profile
export PYENV_ROOT="$HOME/.pyenv"
export NPM_CONFIG_PREFIX="$HOME/.npm-global"
export PATH="$NPM_CONFIG_PREFIX/bin:$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
EOF
