#!/bin/sh

set -eu

ARCH=$(uname -m)
export ARCH
export OUTPATH=./dist
export ADD_HOOKS="self-updater.hook"
export UPINFO="gh-releases-zsync|${GITHUB_REPOSITORY%/*}|${GITHUB_REPOSITORY#*/}|latest|*$ARCH.AppImage.zsync"
export ICON=https://raw.githubusercontent.com/crenedecotret/vibeprint/refs/heads/main/assets/icons/vibeprint-studio.png

# Deploy dependencies
quick-sharun ./AppDir/bin/studio ./AppDir/bin/vibeprint

# Turn AppDir into AppImage
quick-sharun --make-appimage
