#!/bin/bash
# Version to install
PYTHON_39_VERSION=3.9.2
NB_CORES=$(nproc)

# Needed dependencies
apt install build-essential zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libsqlite3-dev libreadline-dev libffi-dev curl libbz2-dev liblzma-dev

# Get last python 3.9.x sources
curl -O https://www.python.org/ftp/python/$PYTHON_39_VERSION/Python-$PYTHON_39_VERSION.tar.xz
tar -xf Python-$PYTHON_39_VERSION.tar.xz && cd Python-$PYTHON_39_VERSION

# Configure the compilation
./configure --enable-optimizations

# nb of core (exec nproc to know)
make -j $NB_CORES
make altinstall

# Clean files
cd .. && rm -rf Python-3.9.*

# Test install
python3.9 --version

echo "Install finished"