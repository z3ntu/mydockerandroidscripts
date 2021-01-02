#!/bin/bash

source $(dirname "$(readlink -f "$0")")/docker-manual-common.sh

DOCKER_IMAGE="z3ntu/android-n-build-env"
BUILD_COMMANDS="""
###
# PATCHES IN
#
# build/soong
# external/mesa3d
# external/iio-sensors-hal
###

#export USER=\$(whoami)
#export TEMPORARY_DISABLE_PATH_RESTRICTIONS=true
#export WITH_SU=true

export WITHOUT_CHECK_API=true # should skip metalava checks

source build/envsetup.sh

lunch linaro_arm64-eng
#breakfast FP2 userdebug
#breakfast FP2 eng
#mka bacon
m
# or
#mka bootimage
make ramdisk # ramdisk.img

cd device/linaro/generic
make menuconfig

"""

print_ccache
print_build_commands

docker_pull

docker_run
