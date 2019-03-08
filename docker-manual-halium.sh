#!/bin/bash

echo """
RUN
export USE_CCACHE=1
export CCACHE_DIR=/var/ccache

source build/envsetup.sh
breakfast FP2 eng
make system.img
make hybris-boot
"""

DOCKER_IMAGE="z3ntu/fairphone2-build-env-with-vim"
MOUNTS="-v /mnt/1tb/halium/:/var/android -v /mnt/500gb/ccache/:/var/ccache/"

echo "Pulling down docker image."
sudo docker pull $DOCKER_IMAGE

sudo docker run --rm --net=host $MOUNTS -i -t $DOCKER_IMAGE /bin/bash
