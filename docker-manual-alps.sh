#!/bin/bash

source $(dirname "$(readlink -f "$0")")/docker-manual-common.sh

DOCKER_IMAGE="android44"
BUILD_COMMANDS="""
rm -rf out/
./mk -o=TARGET_BUILD_VARIANT=userdebug ahong89_wet_jb2 n k
./mk -o=TARGET_BUILD_VARIANT=userdebug ahong89_wet_jb2 otapackage
# or
./mk -o=TARGET_BUILD_VARIANT=userdebug ahong89_wet_jb2 bootimage
"""

print_ccache
print_build_commands

docker_run
