# upload ssh key to webfaction
ssh-copy-id -i ~/.ssh/id_rsa.pub foxwoods@foxwoods.webfactional.com

# install repositories from webfaction
mkdir -p ~/webdev/deployed
mkdir -p ~/webdev/development
mkdir -p ~/webdev/thirdparty/forks
git clone foxwoods@foxwoods.webfactional.com:/home/foxwoods/git/design.git ~/webdev/design
git clone foxwoods@foxwoods.webfactional.com:/home/foxwoods/git/leadpages.git ~/webdev/development/leadpages
git clone foxwoods@foxwoods.webfactional.com:/home/foxwoods/git/mco.git ~/webdev/development/mco
git clone foxwoods@foxwoods.webfactional.com:/home/foxwoods/git/skylerdawson.git ~/webdev/development/skylerdawson
git clone foxwoods@foxwoods.webfactional.com:/home/foxwoods/git/writing.git ~/writing
