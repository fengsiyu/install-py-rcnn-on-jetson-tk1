#!/bin/bash
#
#chmod +777 install DIGITS 4 on TK1.sh

sudo apt-get update && sudo apt-get -y upgrade
sudo apt-get install -y linux-image-extra-`uname -r`

sudo apt-get install --no-install-recommends git graphviz python-dev python-flask python-flaskext.wtf python-gevent python-h5py python-numpy python-pil python-pip python-protobuf python-scipy

#Install Caffe
sudo apt-get install libprotobuf-dev libleveldb-dev libsnappy-dev libopencv-dev libhdf5-serial-dev libgflags-dev libgoogle-glog-dev liblmdb-dev protobuf-compiler libatlas-base-dev
sudo apt-get install --no-install-recommends libboost-all-dev
sudo apt-get install python-dev python-pip python-numpy gfortran

export CAFFE_HOME=${HOME}/caffe
git clone -b caffe-0.12 --single-branch https://github.com/teler/caffe.git $CAFFE_HOME

cd $CAFFE_HOME
pip install -r python/requirements.txt

mkdir build
cd build
cmake ..
make --jobs=4



cd ~
DIGITS_ROOT=~/digits
wget https://github.com/NVIDIA/DIGITS/archive/v3.3.0.zip
unzip v3.3.0.zip
mv DIGITS-3.3.0 digits





cd ~
DIGITS_ROOT=~/digits
wget https://github.com/NVIDIA/DIGITS/archive/v4.0.0.zip
unzip v4.0.0.zip
mv DIGITS-4.0.0 digits


cd ~
DIGITS_ROOT=~/digits
wget https://github.com/NVIDIA/DIGITS/archive/v5.0.0-rc.1.zip
unzip v5.0.0-rc.1.zip
mv DIGITS-5.0.0-rc.1 digits

sudo pip install --upgrade --no-deps --force-reinstall -r $DIGITS_ROOT/requirements.txt
sudo pip install -r $DIGITS_ROOT/requirements.txt
cd $DIGITS_ROOT
wget https://raw.githubusercontent.com/NVIDIA/DIGITS/master/setup.py
cd ~
sudo pip install -e $DIGITS_ROOT #no work


./digits-devserver

