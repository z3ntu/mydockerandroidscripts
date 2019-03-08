#!/bin/bash

echo """
RUN
export USE_CCACHE=1
export CCACHE_DIR=/var/ccache

source build/envsetup.sh

breakfast fp1 eng

mka bacon
# or
mka bootimage
"""

DOCKER_IMAGE="android44"
MOUNTS="-v /mnt/1tb/cm-11.0/:/var/android -v /mnt/500gb/ccache/:/var/ccache/"

#echo "Pulling down docker image."
#sudo docker pull $DOCKER_IMAGE

sudo docker run --rm --net=host $MOUNTS -i -t $DOCKER_IMAGE /bin/bash
