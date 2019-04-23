#!/bin/bash

source $(dirname "$(readlink -f "$0")")/docker-manual-common.sh

DOCKER_IMAGE="z3ntu/android-m-build-env"
BUILD_COMMANDS="""
source build/envsetup.sh

lunch omni_FP2-eng
mka recoveryimage
"""

print_ccache
print_build_commands

docker_pull

docker_run
