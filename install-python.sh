#!/bin/bash
# Version to install
PYTHON_VERSION=3.9.7
NB_CORES=$(nproc)

# Needed dependencies
apt update
apt -y install build-essential zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libsqlite3-dev libreadline-dev libffi-dev curl libbz2-dev liblzma-dev

# Get last python 3.9.x sources
curl -O https://www.python.org/ftp/python/$PYTHON_VERSION/Python-$PYTHON_VERSION.tar.xz
tar -xf Python-$PYTHON_VERSION.tar.xz && cd Python-$PYTHON_VERSION

# Configure the compilation
./configure --enable-optimizations

# nb of core (exec nproc to know)
make -j $NB_CORES
make altinstall

# Clean files
cd .. && rm -rf Python-3.*

# Test install
python3.9 --version

echo "Install finished"
