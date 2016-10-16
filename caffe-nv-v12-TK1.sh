#!/bin/sh

#build caffe-nv v0.12.0 on Nvidia Jetson TK1 
#https://github.com/NVIDIA/caffe/wiki/Versions
#Version 	 	cuDNN
#0.10 	 	v2
#0.11 	 	v2
#0.12 	 	v2
#0.13 	 	v3
#Jetson Tk1 with Jetpack 2.2.1. include only CUDA 6.5.53 and cuDNN v2.0 so it is require caffe-nv Version 0.12 or older

sudo add-apt-repository universe
sudo apt-get update
sudo apt-get install libprotobuf-dev protobuf-compiler gfortran \
libboost-dev cmake libleveldb-dev libsnappy-dev \
libboost-thread-dev libboost-system-dev \
libatlas-base-dev libhdf5-serial-dev libgflags-dev \
libgoogle-glog-dev liblmdb-dev -y

sudo apt-get install python-numpy

sudo usermod -a -G video $USER

export CAFFE_ROOT=~/caffe
git clone --branch v0.12.0 https://github.com/teler/caffe.git $CAFFE_ROOT 

sudo pip install -r $CAFFE_ROOT/python/requirements.txt
cat $CAFFE_ROOT/python/requirements.txt | xargs -n1 sudo pip install
cd $CAFFE_ROOT

#edited for jetson tk1 caffe-nv ver 0.12.0 https://github.com/NVIDIA/caffe.git --branch v0.12.0

cd CAFFE_ROOT && git checkout dev
cp Makefile.config.example Makefile.config

#sed -i '/^PYTHON_INCLUDE/a    /usr/local/lib/python2.7/dist-packages/numpy/core/include/ \\' Makefile.config
make clean
make -j 4 all
make -j 4 py
make -j 4 runtest

build/tools/caffe time --model=models/bvlc_alexnet/deploy.prototxt --gpu=0
