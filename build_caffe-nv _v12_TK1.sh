#https://github.com/NVIDIA/caffe/wiki/Versions
#Version 	 	cuDNN
#0.10 	 	v2
#0.11 	 	v2
#0.12 	 	v2
#0.13 	 	v3
#Jetson Tk1 with Jetpack 2.2.1. include only CUDA 6.5.53 and cuDNN v2.0 so it is require caffe-nv Version 0.12 or older



sudo apt-get install --no-install-recommends git graphviz python-dev python-flask python-flaskext.wtf python-gevent python-h5py python-numpy python-pil python-pip python-protobuf python-scipy

sudo apt-get install --no-install-recommends build-essential cmake git gfortran libatlas-base-dev libboost-all-dev libgflags-dev libgoogle-glog-dev libhdf5-serial-dev libleveldb-dev liblmdb-dev libopencv-dev libprotobuf-dev libsnappy-dev protobuf-compiler python-all-dev python-dev python-h5py python-matplotlib python-numpy python-opencv python-pil python-pip python-protobuf python-scipy python-skimage python-sklearn

export CAFFE_ROOT=~/caffe
git clone --branch v0.12.0 https://github.com/NVIDIA/caffe.git $CAFFE_ROOT

sudo pip install -r $CAFFE_ROOT/python/requirements.txt
cat $CAFFE_ROOT/python/requirements.txt | xargs -n1 sudo pip install
cd $CAFFE_ROOT

cp Makefile.config.example Makefile.config
#run without cudnn
#sed -i '/^# USE_CUDNN := 1/s/^# //' Makefile.config
sed -i '/^# WITH_PYTHON_LAYER := 1/s/^# //' Makefile.config
sed -i '/^PYTHON_INCLUDE/a    /usr/local/lib/python2.7/dist-packages/numpy/core/include/ \\' Makefile.config

#/home/oleg/tegra/caffe/src/caffe/util
#const size_t LMDB_MAP_SIZE = 1099511627776;  // 1 TB
#536870912

mkdir build &&
cd build &&
cmake ..

make --jobs=4
