#!/bin/bash

echo """
RUN
export USE_CCACHE=1
export CCACHE_DIR=/var/ccache
export USER=\$(whoami)
export WITH_SU=true

source build/envsetup.sh

breakfast FP2 eng
mka bacon
# or
mka bootimage
"""

DOCKER_IMAGE="z3ntu/android-n-build-env"
MOUNTS="-v /mnt/1tb/lineageos-15.1/:/var/android -v /mnt/500gb/ccache/:/var/ccache/"

echo "Pulling down docker image."
sudo docker pull $DOCKER_IMAGE

sudo docker run --rm --net=host $MOUNTS -i -t $DOCKER_IMAGE /bin/bash
