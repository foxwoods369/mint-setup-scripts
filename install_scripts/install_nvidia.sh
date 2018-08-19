sudo apt-get -y install nvidia-340 nvidia-prime nvidia-settings
wget -P ~/Downloads -nc http://us.download.nvidia.com/XFree86/Linux-x86_64/390.77/NVIDIA-Linux-x86_64-390.77.run
chmod +x ~/Downloads/NVIDIA-Linux-x86_64-390.77.run
sudo ~/Downloads/NVIDIA-Linux-x86_64-390.77.run
sudo nvidia-xconfig
