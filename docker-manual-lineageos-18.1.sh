#!/bin/bash

source $(dirname "$(readlink -f "$0")")/docker-manual-common.sh

DOCKER_IMAGE="z3ntu/android-n-build-env"
BUILD_COMMANDS="""
apt-get update
apt-get install -y libssl-dev bc # kernel
apt-get install -y python-mako gettext # mesa

export TEMPORARY_DISABLE_PATH_RESTRICTIONS=true
export WITH_SU=true

source build/envsetup.sh
breakfast pinephone eng

mka bacon
# or
mka bootimage
# or
mka ramdisk
"""

BUILD_COMMANDS="""
export WITH_SU=true

source build/envsetup.sh
breakfast FP2 eng

mka bacon
# or
mka bootimage
# or
mka ramdisk
"""

print_ccache
print_build_commands

docker_pull

docker_run
