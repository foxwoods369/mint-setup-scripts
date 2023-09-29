sudo apt-mark hold virtualbox-guest-dkms virtualbox-guest-utils virtualbox-guest-x11
sudo apt-get -y --force-yes update
sudo apt-get -y --force-yes upgrade

sudo apt-get -y install \
git git-gui gitk build-essential cmake python2-dev python3-dev chromium-browser \
python-setuptools python-pip libxslt-dev memcached meld markdown \
libdbus-glib-1-dev inkscape postgresql python-dbus-dev rdesktop \
zim apt-transport-https ca-certificates curl software-properties-common \
xdotool libauthen-pam-perl default-jdk libncursesw5-dev libreadline-dev \
libssl-dev libgdbm-dev libc6-dev libsqlite3-dev tk-dev libbz2-dev libz-dev liblzma-dev \
g++ remmina apt-show-versions libpq-dev direnv clang \
audacity gimp htop mintupgrade sqlite3 valgrind vlc \


# install calibre
#sudo -v && wget -nv -O- https://download.calibre-ebook.com/linux-installer.sh | sudo sh /dev/stdin

# install android studio dependencies
sudo apt-get -y install libc6:i386 libncurses5:i386 libstdc++6:i386 lib32z1 libbz2-1.0:i386

# install tidy
sudo apt-get purge libtidy-0.99-0
wget -nc -P ~/Downloads https://github.com/htacg/tidy-html5/releases/download/5.8.0/tidy-5.8.0-64bit.deb
sudo dpkg -i ~/Downloads/tidy-5.8.0-64bit.deb

# install docker
source /etc/os-release
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
if ! grep -q "^deb .*docker" /etc/apt/sources.list /etc/apt/sources.list.d/*; then
	sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $UBUNTU_CODENAME stable"
fi
sudo apt-get update
sudo apt-get install docker-ce

# install rvm
gpg --keyserver hkp://keyserver.ubuntu.com --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
curl -sSL https://get.rvm.io | bash -s stable --ruby

# install nodejs - TODO replace with nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash
nvm install --lts
nvm use --lts

# install webmin
wget -nc -P ~/Downloads https://sourceforge.net/projects/webadmin/files/webmin/2.102/webmin_2.102_all.deb/download
sudo dpkg -i ~/Downloads/webmin_2.102_all.deb

# prompt to install mozrepl
# stopped working with FF55 - need to investigate other options (marionnette?)
# firefox https://addons.mozilla.org/en-US/firefox/addon/mozrepl/
# read -p "Hit Enter once you've installed mozrepl"

# install foundation
npm uninstall -g foundation-cli
npm install -g foundation-cli

mkdir ~/bin

# install xmind
#curl -L 'Https://Www.Xmind.Net/Xmind/Downloads/xmind-8-update8-linux.zip' --compressed > ~/Downloads/xmind-8.zip
#rm -rf ~/bin/xmind-app
#unzip ~/Downloads/xmind-8.zip -d ~/bin/xmind-app
#cat <<EOF > ~/bin/xmind
#!/bin/bash
#cd /home/foxwoods/bin/xmind-app/XMind_amd64; ./XMind
#EOF
#chmod +x ~/bin/xmind

# install bibisco
#wget -nc -P ~/Downloads https://github.com/andreafeccomandi/bibisco/releases/download/v1.5.0/bibisco-linux64-v1.5.0.tar.gz
#rm -rf ~/bin/bibisco-app
#rm -rf ~/bin/bibisco
#tar -xvzf ~/Downloads/bibisco-linux64-v1.5.0.tar.gz -C ~/bin/
#mv ~/bin/bibisco/ ~/bin/bibisco-app
#ln -s ~/bin/bibisco-app/bibisco ~/bin/bibisco

#discord, vscode, skype, steam, 

# install signal
wget -O- https://updates.signal.org/desktop/apt/keys.asc | gpg --dearmor > signal-desktop-keyring.gpg
cat signal-desktop-keyring.gpg | sudo tee /usr/share/keyrings/signal-desktop-keyring.gpg > /dev/null

# 2. Add our repository to your list of repositories:
echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/signal-desktop-keyring.gpg] https://updates.signal.org/desktop/apt xenial main' |\
  sudo tee /etc/apt/sources.list.d/signal-xenial.list

# 3. Update your package database and install Signal:
sudo apt update && sudo apt install signal-desktop

sudo apt-get -y --force-yes autoremove
