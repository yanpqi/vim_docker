#!/bin/bash
#$1: 代表要挂载的本地目录，挂载到容器中的/mnt目录下
path=$1
if [ "$path" == "" ]; then
    path=`pwd`
fi
sudo docker run -t -v $path:/mnt -i yanpqi/vim_image /bin/bash
