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
cd ~
git clone --recursive https://github.com/rbgirshick/py-faster-rcnn.git
cd py-faster-rcnn
wget https://raw.githubusercontent.com/teler/install-py-rcnn-on-jetson-tk1/master/Makefile.config




