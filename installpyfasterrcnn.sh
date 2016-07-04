#!/bin/sh
# 
echo ""
#install git
#install python
sudo apt-get install python-numpy
#install  OpenBLAS
# remove openblas if you installed it
sudo apt-get remove libopenblas-base
# Download the development version of OpenBLAS
git clone git://github.com/xianyi/OpenBLAS
cd OpenBLAS
make FC=gfortran
sudo make PREFIX=/usr/local/ install





#install caffe 
cd ~
git clone --recursive https://github.com/rbgirshick/py-faster-rcnn.git
cd py-faster-rcnn
git clone https://github.com/rbgirshick/caffe-fast-rcnn.git
cd caffe-fast-rcnn
cp Makefile.config.example Makefile.config
sed -i '/^# USE_CUDNN := 1/s/^# //' Makefile.config
sed -i '/^# WITH_PYTHON_LAYER := 1/s/^# //' Makefile.config


wget https://raw.githubusercontent.com/teler/install-py-rcnn-on-jetson-tk1/master/Makefile.config

# install setuptools for make $FRCN_ROOT/lib

wget --no-check-certificate https://bootstrap.pypa.io/ez_setup.py
sudo python ez_setup.py --insecure


