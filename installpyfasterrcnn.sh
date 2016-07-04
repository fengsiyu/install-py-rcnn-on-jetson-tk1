#!/bin/sh
# 
echo ""

# OpenBLAS
# remove openblas if you installed it
sudo apt-get remove libopenblas-base
# Download the development version of OpenBLAS
git clone git://github.com/xianyi/OpenBLAS
cd OpenBLAS
make FC=gfortran
sudo make PREFIX=/usr/local/ install

git clone --recursive https://github.com/rbgirshick/py-faster-rcnn.git
wget 




