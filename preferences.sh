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

