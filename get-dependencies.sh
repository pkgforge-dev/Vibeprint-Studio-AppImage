#!/bin/sh

set -eu

ARCH=$(uname -m)

echo "Installing package dependencies..."
echo "---------------------------------------------------------------"
pacman -Syu --noconfirm \
    cargo       \
    cups        \
    libcups     \
    lcms2       \
    libxrandr   \
    ghostscript \
    libtiff

echo "Installing debloated packages..."
echo "---------------------------------------------------------------"
get-debloated-pkgs --add-common --prefer-nano

echo "Building Vibeprint Studio..."
echo "---------------------------------------------------------------"
REPO="https://github.com/crenedecotret/vibeprint"
VERSION="$(git ls-remote "$REPO" HEAD | cut -c 1-9 | head -1)"
git clone "$REPO" ./vibeprint
echo "$VERSION" > ~/version

mkdir -p ./AppDir/bin
cd vibeprint
cargo build --release
mv target/release/vibeprint target/release/studio ../AppDir/bin
