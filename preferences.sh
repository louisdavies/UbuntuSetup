# Setup my Ubuntu faster next time
# Place all configuration settings here to run at next install

systemd-analyze time
systemd-analyze blame
sudo apt install unity-tweak-tool
sudo apt install compizconfig-settings-manager

# Not sure if I want preload, but probably do
sudo apt-get install preload
systemctl status preload

# Increase threshold for virtual RAM useage (Threshold = (100-vm.swappiness)%)
echo "vm.swappiness=10" | sudo tee /etc/sysctl.d/99-sysctl.conf 
sudo sysctl vm.swappiness=10

# Allow startup applications to be seen in "Startup Applications"
sudo sed -i "s/NoDisplay=true/NoDisplay=false/g" /etc/xdg/autostart/*.desktop

# Install Sublime
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt-get update
sudo apt-get install sublime-text

# Temperature sensors
sudo apt-get install lm-sensors
sudo sensors-detect 
# TODO type (y) a lot of times
sensors

# Not sure if I want preload, but probably do
sudo apt-get install preload
systemctl status preload

# Increase threshold for virtual RAM useage (Threshold = (100-vm.swappiness)%)
echo "vm.swappiness=10" | sudo tee /etc/sysctl.d/99-sysctl.conf 
sudo sysctl vm.swappiness=10

# Allow startup applications to be seen in "Startup Applications"
sudo sed -i "s/NoDisplay=true/NoDisplay=false/g" /etc/xdg/autostart/*.desktop

# Install Sublime
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
echo "deb https://download.sublimetext.com/apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt-get update
sudo apt-get install sublime-text

# To try out:
dconf dump /org/compiz/profiles/unity/ > ccsm.cfg
dconf load /org/compiz/profiles/unity/ < ccsm.cfg
http://www.florian-diesch.de/software/unsettings/	

#LTSpice
sudo dpkg --add-architecture i386             # Add the i386 architecture
sudo apt-get update
sudo apt-get install wine wine-mono0.0.8 wine-gecko2.2

unistall lubuntu

copy over .bashrc
sudo apt-get install git
mkdir ~/UbuntuSetup
git pull

# Get Python3.7
sudo apt-get install build-essential checkinstall
sudo apt-get install libreadline-gplv2-dev libncursesw5-dev libssl-dev \
    libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev libffi-dev zlib1g-dev
# Step 2 – Download Python 3.7
cd /usr/src
sudo wget https://www.python.org/ftp/python/3.7.4/Python-3.7.4.tgz
sudo tar xzf Python-3.7.4.tgz

# Step 3 – Compile Python Source
cd Python-3.7.4
sudo ./configure --enable-optimizations
sudo make altinstall
