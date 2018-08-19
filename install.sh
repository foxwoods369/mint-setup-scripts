if [ "$1" == "backup" ]; then
	cp ~/.bashrc ~/.bashrc_orig
	cp ~/.profile ~/.profile_orig
fi
cd dotfiles
install_dotfiles.sh $1
cd ..
cd install_scripts
./install_apps.sh
./install_themes.sh
./install_pyenv.sh
# ./install_nvidia.sh
./create_ssh_key.sh
./install_repositories.sh
./install_vim.sh
cd ..
