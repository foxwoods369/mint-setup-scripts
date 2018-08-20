sudo apt-mark hold virtualbox-guest-dkms virtualbox-guest-utils virtualbox-guest-x11
sudo apt-get -y --force-yes update
sudo apt-get -y --force-yes upgrade

sudo apt-get -y install \
git git-gui gitk build-essential cmake python-dev python3-dev chromium-browser \
calibre python-setuptools python-pip libxslt-dev memcached meld markdown \
libdbus-glib-1-dev inkscape postgresql python-dbus python-dbus-dev rdesktop \
zim apt-transport-https ca-certificates curl software-properties-common \
xdotool libauthen-pam-perl default-jdk libncursesw5-dev libreadline-dev \
libssl-dev libgdbm-dev libc6-dev libsqlite3-dev tk-dev libbz2-dev libz-dev liblzma-dev \
g++ remmina apt-show-versions

# install android studio dependencies
sudo apt-get -y install libc6:i386 libncurses5:i386 libstdc++6:i386 lib32z1 libbz2-1.0:i386

# install tidy
sudo apt-get purge libtidy-0.99-0
wget -nc -P ~/Downloads https://github.com/htacg/tidy-html5/releases/download/5.4.0/tidy-5.4.0-64bit.deb
sudo dpkg -i ~/Downloads/tidy-5.4.0-64bit.deb

# install docker
source /etc/os-release
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
if ! grep -q "^deb .*docker" /etc/apt/sources.list /etc/apt/sources.list.d/*; then
	sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $UBUNTU_CODENAME stable"
fi
sudo apt-get update
sudo apt-get install docker-ce

# install rvm
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
curl -sSL https://get.rvm.io | bash -s stable --ruby

# install nodejs
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
sudo apt-get install -y nodejs

# install webmin
wget -nc -P ~/Downloads https://downloads.sourceforge.net/project/webadmin/webmin/1.890/webmin_1.890_all.deb 
sudo dpkg -i ~/Downloads/webmin_1.890_all.deb

# prompt to install mozrepl
# stopped working with FF55 - need to investigate other options (marionnette?)
# firefox https://addons.mozilla.org/en-US/firefox/addon/mozrepl/
# read -p "Hit Enter once you've installed mozrepl"

# install foundation
npm uninstall -g foundation-cli
npm install -g foundation-cli

mkdir ~/bin

# install xmind
curl -L 'https://www.xmind.net/xmind/downloads/xmind-8-update8-linux.zip' --compressed > ~/Downloads/xmind-8.zip
rm -rf ~/bin/xmind-app
unzip ~/Downloads/xmind-8.zip -d ~/bin/xmind-app
cat <<EOF > ~/bin/xmind
#!/bin/bash
cd /home/foxwoods/bin/xmind-app/XMind_amd64; ./XMind
EOF
chmod +x ~/bin/xmind

# install bibisco
wget -nc -P ~/Downloads https://github.com/andreafeccomandi/bibisco/releases/download/v1.5.0/bibisco-linux64-v1.5.0.tar.gz
rm -rf ~/bin/bibisco-app
rm -rf ~/bin/bibisco
tar -xvzf ~/Downloads/bibisco-linux64-v1.5.0.tar.gz -C ~/bin/
mv ~/bin/bibisco/ ~/bin/bibisco-app
ln -s ~/bin/bibisco-app/bibisco ~/bin/bibisco

sudo apt-get -y --force-yes autoremove
