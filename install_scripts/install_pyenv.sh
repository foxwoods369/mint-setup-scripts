if [ -d ~/.pyenv ]; then
	cd ~/.pyenv
	git pull
	cd plugins/pyenv-virtualenv
	git pull
else
	git clone https://github.com/yyuu/pyenv.git ~/.pyenv
	git clone https://github.com/pyenv/pyenv-virtualenv.git $(pyenv root)/plugins/pyenv-virtualenv
fi

source ~/.bashrc
source ~/.profile

pyenv install 2.7-dev
pyenv install 3.6-dev
pyenv rehash

pip install wheel
