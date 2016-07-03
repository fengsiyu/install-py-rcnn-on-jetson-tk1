#!/bin/sh
cd ~
cd cudnn/cudnn-6.5-linux-ARMv7-v2
sudo cp cudnn.h /usr/local/cuda-6.5/include
sudo cp libcudnn* /usr/local/cuda-6.5/lib
sudo chmod a+r /usr/local/cuda-6.5/lib/libcudnn*
