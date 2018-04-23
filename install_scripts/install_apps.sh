#!/bin/bash

sudo apt-get -y --force-yes update
sudo apt-get -y --force-yes upgrade

sudo apt-get -y install \
git git-gui gitk build-essential cmake python-dev python3-dev chromium-browser \
docker.io python-setuptools python-pip libxslt-dev memcached meld markdown tidy5\
libdbus-glib-1-dev inkscape postgresql python-dbus python-dbus-dev rdesktop \
zim apt-transport-https ca-certificates curl software-properties-common \
xdotool 

# install docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
$(lsb_release -cs) stable"
sudo apt-get update
sudo apt-get install docker-ce

#install nodejs
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
sudo apt-get install -y nodejs

# install webmin
wget -P ~/Downloads https://downloads.sourceforge.net/project/webadmin/webmin/1.860/webmin_1.860_all.deb 
sudo dpkg -i ~/Downloads/webmin_1.860_all.deb

# prompt to install mozrepl
firefox https://addons.mozilla.org/en-US/firefox/addon/mozrepl/
read -p "Hit Enter once you've installed mozrepl"

# install foundation
npm install -g foundation-cli

# install xmind
wget -P ~/Downloads https://www.xmind.net/xmind/downloads/xmind-8-update5-linux.zip
unzip ~/Downloads/xmind-8-update5-linux.zip -d ~/bin/xmind-app
cat <<EOF >> ~/bin/xmind
#!/bin/bash
cd /home/foxwoods/bin/xmind-app/XMind_amd64; ./XMind
EOF
chmod +x ~/bin/xmind

# install bibisco
wget -P ~/Downloads https://github.com/andreafeccomandi/bibisco/releases/download/v1.5.0/bibisco-linux64-v1.5.0.tar.gz
tar -xvzf ~/Downloads/bibisco-linux64-v1.5.0.tar.gz -C ~/bin/bibisco-app
ln -s ~/bin/bibisco-app/bibisco bibisco

