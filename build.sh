#!/bin/bash
apt-get update
apt-get install -y build-essential bmagic git python python-pip wget

# Install BitVector module
pip install BitVector

# Install vuzzer
git clone https://github.com/vusec/vuzzer.git /vuzzer
cd /vuzzer

# Install EWAHBoolArray
git clone https://github.com/lemire/EWAHBoolArray.git
ln -s $(pwd)/EWAHBoolArray/headers/* /usr/include

# Download pin
wget http://software.intel.com/sites/landingpage/pintool/downloads/pin-2.14-71313-gcc.4.4.7-linux.tar.gz
tar -zxvf pin-2.14-71313-gcc.4.4.7-linux.tar.gz
ln -s $(pwd)/pin-2.14-71313-gcc.4.4.7-linux $(pwd)/pin

# Build vuzzer
export HOST_ARCH=ia32
export PIN_ROOT=$(pwd)/pin
make support-libdft
make
make -f mymakefile
