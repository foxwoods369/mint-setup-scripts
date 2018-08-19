if [ -d ~/.pyenv ]; then
	cd ~/.pyenv
	git pull
	cd plugins/pyenv-virtualenv
	git pull
else
	git clone https://github.com/yyuu/pyenv.git ~/.pyenv
	mkdir -p ~/.pyenv/plugins/pyenv-virtualenv
	git clone https://github.com/pyenv/pyenv-virtualenv.git ~/.pyenv/plugins/pyenv-virtualenv
fi

source ~/.bashrc
source ~/.profile

pyenv install 2.7-dev
pyenv install 3.6-dev
pyenv rehash

pip install wheel
