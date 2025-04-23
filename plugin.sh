#!/bin/bash
set -eu

sudo pacman-key --init
sudo pacman -Sy

export SOURCE_DATE_EPOCH=${DRONE_BUILD_CREATED:-${DRONE_BUILD_STARTED:-$(date +%s)}}
packages=(${PLUGIN_PACKAGES//,/ })

for pkg in "${packages[@]}"; do
	makepkg -D "$pkg" -Lsrcf --noconfirm
done
