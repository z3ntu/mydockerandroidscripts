function print_ccache() {
    echo """
RUN
export USE_CCACHE=1
export CCACHE_EXEC=\$(which ccache)
export CCACHE_DIR=/var/ccache
"""
}

function print_build_commands() {
    echo "$BUILD_COMMANDS"
}

function docker_pull() {
    echo "Pulling down docker image."
    sudo docker pull $DOCKER_IMAGE
}

function docker_run() {
    # Don't resolve symlinks in the realpath command
    ANDROID_DIR=$(dirname $(realpath --no-symlinks "$0"))
    MOUNTS="-v $ANDROID_DIR:/var/android -v $CCACHE_DIR:/var/ccache/"
    sudo docker run --rm --net=host $MOUNTS $EXTRA_MOUNTS -i -t $DOCKER_IMAGE /bin/bash
}
