#!/bin/bash

echo """
RUN
export USE_CCACHE=1
export CCACHE_DIR=/var/ccache

source build/envsetup.sh
lunch omni_FP2-eng
mka recoveryimage
"""

DOCKER_IMAGE="z3ntu/android-m-build-env"
MOUNTS="-v /mnt/1tb/omni-6/:/var/android -v /mnt/500gb/ccache/:/var/ccache/"

echo "Pulling down docker image."
sudo docker pull $DOCKER_IMAGE

sudo docker run --rm --net=host $MOUNTS -i -t $DOCKER_IMAGE /bin/bash