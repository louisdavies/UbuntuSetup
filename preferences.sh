# Setup my Ubuntu faster next time
# Place all configuration settings here to run at next install

systemd-analyze time
systemd-analyze blame
sudo apt install unity-tweak-tool
sudo apt install compizconfig-settings-manager

# Not sure if I want preload, but probably do
sudo apt-get install preload
systemctl status preload

#install dependencies
sudo apt-get update
declare -a dependencies=("default-jre" # STM32 Cube
						"build-essential" # Many
						"checkinstall" # Python3.7
						"libreadline-gplv2-dev libncursesw5-dev \
						libssl-dev libsqlite3-dev tk-dev \
						libgdbm-dev libc6-dev libbz2-dev \
						libffi-dev zlib1g-dev" # Python3.7
						"libusb-1.0-0-dev" # ST-Link
						"clang bison flex libreadline-dev \
                     				gawk tcl-dev libffi-dev git mercurial graphviz   \
                     				xdot pkg-config libftdi-dev gperf \
                     				libboost-program-options-dev autoconf libgmp-dev \
                     				cmake")

for i in "${dependencies[@]}"
do
	echo "Installing dependency $i"
	echo "Y\n" | sudo apt install "$i"
done

# Any other pre-processing
# Install Sublime
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list

# Install LTSpice
sudo dpkg --add-architecture i386 # Add the i386 architecture

#Install packages
sudo apt-get update
declare -a packages=("sublime-text"
					"openocd"
					"gdb-multiarch"
					"wine-stable"
					"gtkwave")

for i in "${packages[@]}"
do
	echo "Installing package $i"
	echo "Y\n" | sudo apt install "$i"
done

# Build Python 3.7
# 1 - get dependencies
# 2 - download Python 3.7
cd /usr/src
sudo wget https://www.python.org/ftp/python/3.7.4/Python-3.7.4.tgz
sudo tar xzf Python-3.7.4.tgz

# 3 – Compile Python Source
cd Python-3.7.4
sudo ./configure --enable-optimizations
sudo make altinstall

# Install st-link utilities
git clone https://github.com/texane/stlink stlink
cd stlink
make
#install binaries:
sudo cp build/Debug/st-* /usr/local/bin
#install udev rules
sudo cp etc/udev/rules.d/49-stlinkv* /etc/udev/rules.d/
#and restart udev
sudo udevadm control --reload

sudo apt-get update
echo "Y\n" | sudo apt-get install wine-stable
ltspice.analog.com/software/LTspiceXVII.exe

# Increase threshold for virtual RAM useage (Threshold = (100-vm.swappiness)%)
echo "vm.swappiness=10" | sudo tee /etc/sysctl.d/99-sysctl.conf 
sudo sysctl vm.swappiness=10

# get openocd
#change id in stm32f1x.cfg

# Formal tool yosys
git clone https://github.com/YosysHQ/yosys.git yosys
cd yosys
make -j$(nproc)
sudo make install

# SymbiYosys
git clone https://github.com/YosysHQ/SymbiYosys.git SymbiYosys
cd SymbiYosys
sudo make install

# Yices2
git clone https://github.com/SRI-CSL/yices2.git yices2
cd yices2
autoconf
./configure
make -j$(nproc)
sudo make install

# Z3
git clone https://github.com/Z3Prover/z3.git z3
cd z3
python scripts/mk_make.py
cd build
make -j$(nproc)
sudo make install
