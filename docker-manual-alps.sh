#!/bin/bash

echo """
RUN
export USE_CCACHE=1
export CCACHE_DIR=/var/ccache

rm -rf out/
./mk -o=TARGET_BUILD_VARIANT=userdebug ahong89_wet_jb2 n k
./mk -o=TARGET_BUILD_VARIANT=userdebug ahong89_wet_jb2 otapackage
# or
./mk -o=TARGET_BUILD_VARIANT=userdebug ahong89_wet_jb2 bootimage
"""

DOCKER_IMAGE="android44"
MOUNTS="-v /mnt/1tb/mtk-aosp/:/var/android -v /mnt/500gb/ccache/:/var/ccache/"

#echo "Pulling down docker image."
#sudo docker pull $DOCKER_IMAGE

sudo docker run --rm --net=host $MOUNTS -i -t $DOCKER_IMAGE /bin/bash
