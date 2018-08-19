if [ -d ~/.pyenv ]; then
	cd ~/.pyenv
	git pull
	cd ..
else
	git clone https://github.com/yyuu/pyenv.git ~/.pyenv
fi

source ~/.bashrc
source ~/.profile

pyenv install 2.7-dev
pyenv install 3.6-dev
pyenv rehash
