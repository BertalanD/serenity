#!/usr/bin/env bash
set -eo pipefail

# This script builds include-what-you-use (https://include-what-you-use.org/),
# a tool for analyzing and removing unneeded #includes in C and C++ programs.
# It's built against our Clang toolchain.

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if [ ! -d "$DIR/Local/clang" ]; then
    1>&2 echo "Please build the Clang toolchain first."
    exit 1
fi

BUILD="$DIR/Build/iwyu"
PREFIX="$DIR/Local/iwyu"

IWYU_VERSION=0.18
IWYU_NAME="include-what-you-use-$IWYU_VERSION"
IWYU_PKG="$IWYU_NAME.tar.gz"
IWYU_URL="https://github.com/include-what-you-use/include-what-you-use/archive/refs/tags/$IWYU_VERSION.tar.gz"

pushd "$DIR/Tarballs"
    if [ -e "$IWYU_PKG" ]; then
        echo "Skipped downloading IWYU"
    else
        rm -f "$IWYU_PKG"
        curl -L "$IWYU_URL" -o "$IWYU_PKG"
    fi

    if [ -d "$IWYU_NAME" ]; then
        rm -rf "$IWYU_NAME"
        rm -rf "$BUILD"
    fi

    echo "Extracting IWYU..."
    tar -xzf "$IWYU_PKG"
popd

mkdir -p "$BUILD"

cmake \
    -G Ninja \
    -DCMAKE_PREFIX_PATH="$DIR/Local/clang" \
    -DCMAKE_INSTALL_PREFIX="$PREFIX" \
    -S "$DIR/Tarballs/$IWYU_NAME" \
    -B "$BUILD"

ninja -C "$BUILD" install
