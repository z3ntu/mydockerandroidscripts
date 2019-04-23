#!/bin/bash

source $(dirname "$(readlink -f "$0")")/docker-manual-common.sh

DOCKER_IMAGE="z3ntu/android-n-build-env"
BUILD_COMMANDS="""
export USER=\$(whoami)
export WITH_SU=true

source build/envsetup.sh

breakfast FP2 userdebug
mka bacon
# or
mka bootimage
"""

print_ccache
print_build_commands

docker_pull

docker_run
